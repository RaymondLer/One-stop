﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Security.Principal;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Web.Security;

namespace One_stop
{
    public class Security
    {
        public static string GetHash(string strPass)
        {
            byte[] binPass = Encoding.Default.GetBytes(strPass);

            SHA256 sha = SHA256.Create();
            byte[] binHash = sha.ComputeHash(binPass);
            string strHash = Convert.ToBase64String(binHash);

            return strHash;
        }

        public static void LoginUser(string username, string role, bool rememberMe)
        {
            HttpContext ctx = HttpContext.Current;

            HttpCookie authCookie = FormsAuthentication.GetAuthCookie(username, rememberMe);
            FormsAuthenticationTicket oldTicket = FormsAuthentication.Decrypt(authCookie.Value);
            FormsAuthenticationTicket newTicket = new FormsAuthenticationTicket(
                oldTicket.Version,
                oldTicket.Name,
                oldTicket.IssueDate,
                oldTicket.Expiration,
                oldTicket.IsPersistent,
                role
            );
            authCookie.Value = FormsAuthentication.Encrypt(newTicket);
            ctx.Response.Cookies.Add(authCookie);

            string redirectUrl = FormsAuthentication.GetRedirectUrl(username, rememberMe);
            ctx.Response.Redirect(redirectUrl);
        }

        public static void ProcessRoles()
        {
            HttpContext ctx = HttpContext.Current;

            if (ctx.User != null &&
                ctx.User.Identity.IsAuthenticated &&
                ctx.User.Identity is FormsIdentity)
            {
                FormsIdentity identity = (FormsIdentity)ctx.User.Identity;
                string[] roles = identity.Ticket.UserData.Split(',');

                GenericPrincipal principal = new GenericPrincipal(identity, roles);
                ctx.User = principal;
                Thread.CurrentPrincipal = principal;
            }
        }

        public static string ParseOutHTML(string htmlContent)
        {
            var parsedContent = string.Empty;
            var tagPattern = new Regex(@"(?<=^|>)[^><]+?(?=<|$)", RegexOptions.IgnoreCase);
            var tagsRemoved = tagPattern.Matches(htmlContent);
            foreach (Match match in tagsRemoved)
                parsedContent += match.Value.Trim() + " ";
            return parsedContent;
        }
    }
}