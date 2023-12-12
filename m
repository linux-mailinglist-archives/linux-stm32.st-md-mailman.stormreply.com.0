Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE2A80F603
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 20:07:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5431BC6C856;
	Tue, 12 Dec 2023 19:07:31 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com
 [216.40.44.10])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFE40C6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 19:07:29 +0000 (UTC)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay03.hostedemail.com (Postfix) with ESMTP id 83586A0AA6;
 Tue, 12 Dec 2023 19:07:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf01.hostedemail.com (Postfix) with ESMTPA id AC6D460009; 
 Tue, 12 Dec 2023 19:07:23 +0000 (UTC)
Message-ID: <74126e6e301d2f4a0e5a546caa54961dbc2d492c.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>, Andy Whitcroft
 <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 12 Dec 2023 11:07:22 -0800
In-Reply-To: <20231212094310.3633-1-antonio.borneo@foss.st.com>
References: <20231212094310.3633-1-antonio.borneo@foss.st.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: AC6D460009
X-Stat-Signature: w5n7g444nosr9atuewo16cpfkdo4myh4
X-Spam-Status: No, score=-0.47
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19HSExzuAnmITnpGMOOhmfORfXhjn61ikg=
X-HE-Tag: 1702408043-976277
X-HE-Meta: U2FsdGVkX1+qu2fsds+XWX0ynq9IUdQllRFbwE5CL+N19JiQH2TZmrxd8yiWLMztmVJnsfG6mCuWKsrRztDBPx9H9Q68VfHgwSKwHMgdoWmW6aApliF1xHTKVtl7TS3tN2qV+tVrWr5z3vqSMiul5Xxwx40GLUZ2ty3hkYPTYsddFNJlkkPPYXGJYEeArG5xo97Pyw1uSirZJifx5nUp0yP6CypEBIMsq5eBq5/b4aKibqMK3SKQ2rLhmHRpNMos1urMaPKn450vlPJmR1uVkG1TMACEF2mXt1hxHARHpJWZahcZYhgkdX9T4UeHilNYQxxV3wp9SVfvEJowHkJ7r3jz7ZX3ooqkq9q3ztFhk/QnPg6TM2jDzUxIMwPWU3LFdKC4EyoZDTtPUzTbcgGEzyTtXqpHTubMT/GLvqJSjZf9MvTkLOdeUTfZXAokxWsJ
Cc: =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] checkpatch: use utf-8 match for spell
	checking
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 2023-12-12 at 10:43 +0100, Antonio Borneo wrote:
> The current code that checks for misspelling verifies, in a more
> complex regex, if $rawline matches [^\w]($misspellings)[^\w]
> =

> Being $rawline a byte-string, a utf-8 character in $rawline can
> match the non-word-char [^\w].
> E.g.:
> 	./script/checkpatch.pl --git 81c2f059ab9
> 	WARNING: 'ment' may be misspelled - perhaps 'meant'?
> 	#36: FILE: MAINTAINERS:14360:
> 	+M:     Cl=E9ment L=E9ger <clement.leger@bootlin.com>
> 	            ^^^^
> =

> Use a utf-8 version of $rawline for spell checking.
> =

> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> Reported-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>

Seems sensible, thanks, but:

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3477,7 +3477,8 @@ sub process {
>  # Check for various typo / spelling mistakes
>  		if (defined($misspellings) &&
>  		    ($in_commit_log || $line =3D~ /^(?:\+|Subject:)/i)) {
> -			while ($rawline =3D~ /(?:^|[^\w\-'`])($misspellings)(?:[^\w\-'`]|$)/g=
i) {
> +			my $rawline_utf8 =3D decode("utf8", $rawline);
> +			while ($rawline_utf8 =3D~ /(?:^|[^\w\-'`])($misspellings)(?:[^\w\-'`]=
|$)/gi) {
>  				my $typo =3D $1;
>  				my $blank =3D copy_spacing($rawline);

Maybe this needs to use $rawline_utf8 ?

>  				my $ptr =3D substr($blank, 0, $-[1]) . "^" x length($typo);

And may now the $fix bit will not always work properly

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
