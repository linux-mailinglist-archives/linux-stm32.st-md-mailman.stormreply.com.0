Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KUkRApf+J2pt6wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:52:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A64ED65FAD4
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:52:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linaro.org header.s=google header.b=V0aBBvMW;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linaro.org (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 560A5C8F294;
	Tue,  9 Jun 2026 11:52:54 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A9C9C57A50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2026 16:59:41 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-68c32f3c6d6so4595209a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jun 2026 09:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780937981; cv=none;
 d=google.com; s=arc-20240605;
 b=FDl+6dNQguyVhVQOECzKu+klpL2M3c3i1b3CzlfnpCm3/10OulWEM3ycy8ANHu3SpJ
 YIN3SXVirM0CKKiAHtF8p7wO0n1PvQUZ5fx1lNBWWA95dx68QpDSGK2VDGiEYw2SYF6L
 2duCihCts8DwTG1c089jKhAoqJ3bGpIeMchJzD4jZ9hwNbuTX4aH/mX9dGywZ8dLITdv
 PPNXCTAU9yNW8AtLjQeRj1lDoiBs/lSEZhoB160CZSIZlZ6/EbhqoU8SeVPBV9lPAvkV
 BFCgvB41pvVXHz2hV+3BNlK1g5Wo3deF0GTRxmGJ5EILhaDL4GfOi8+I46PQ61wOfqhQ
 l/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4c8NcNd8HMFFQAYlMpr1XKOoij5wRMxSskwaQiUd7VE=;
 fh=oDfyLvilvRF3lXhuQ9vd7aTelD1EGOxuQ+PvR7Zsn2s=;
 b=fjBA6JzM1Bnvfwo7c2Nj0OdpwDKfPguVo6UDEjd6vX0NXgMxooewvX2BYqAIqAT4tP
 FuTED1aZDOFRC92vI/xBJN2LjtQstRGgIq4feGfZeWFCZ3d5x6Ca5h2i1VR++cMeUTmZ
 Evmue2/gUL4D1aZ82Qy2kOFHlDBwQTwJuWVwwdUPuOLPLwf5wViu7SB3EThJZa2fOjFh
 kFxfUIeGv7PoiPccamzRl86ze/2ZRyAoQD/vvcoN1zt5oLADqDAs/99WekPbrE1Thkm2
 OyLF4P/81ObSaE6gipnR65fd93GUUIlsJ5WiY+duQfkfOTfyc5QXVz67xwDuAAxS7amJ
 C0Fw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780937981; x=1781542781;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4c8NcNd8HMFFQAYlMpr1XKOoij5wRMxSskwaQiUd7VE=;
 b=V0aBBvMW+5dtztrLnuDBWvUU/yeTeziQ0W0AljZnpFH4n2L9bw5oUbShtyFlVNBSuw
 Ej7z4R3QGJ8LWcaImnXLqJpynXj5lQEw5FZ4asVsCPz3bON9POfG6u1nappXUMhPNKvO
 EjGNuOSbZ7AWBtKrG4Gc+ZvtOMv7Undzs3l/sH+Jibgx9Ri+wqa72hQFR4CAn65gByOr
 YipriHJl6sP9Naxb7Xm/ZuNj+s3YLJSs+5bIhxJhyOxrgEQHWd0gU+n9d9G/MBKw6jpK
 J3neKjZ0IjJkLWIjTfEJtIHWbZ5H0/sPWbQxZCArR8Sn29AP8GvqlkWuBSIuf0/IAJ6X
 x/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780937981; x=1781542781;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4c8NcNd8HMFFQAYlMpr1XKOoij5wRMxSskwaQiUd7VE=;
 b=G43JcxiyMaO4IYm1Zepe+f/wLJ1/OG129lr3p+uipT7X+x+4Hx1ibM50KzL19/RDWr
 4bbPHpG56Waa0Dd8jiMLASqcTjIgj4/aUXO/VuoBO77uy1XSqQIIWp1AeWxfixJYXzI4
 pwMvVgJamdW4lPRTkQrEvt2BnrRKX1ky1m8gafrUjbFTf+HQ380iC5b9j6H0qn8EMDiT
 ClqMgKwyyGx2gA8lMbwKl5HsArkTgeeG2f8lwY2GDNUPaUXrU/cAwkhdk6d6evVM3eV5
 5jQ9ic8cFHQuD7X7eOTRvABA2V8I6/Rxw0OLd8ycU0cdW5/k/iYEAN4J1mJcwUsKwvh/
 WuDQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+nTZ5H+cgHLOndSszSR+YEoZysul6hVBSfUJUtEKsZ+6b0oLhImDqYs7sfGila725C0Ej2+pl1MTir4w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxqj0Zc8sI7+x6K1v8jf7Jv376QkPvir0O2Ko1xy7YvnBogfof2
 p8YFwB7YXtgQv1bCpFGGgryJqNKBLBuYTBm+wJUf7zjx/VSANw/aYNiEAV4U6bTTO4soKCpZwGK
 rxv5EkqnDQxFAn27fJrSyhaTCSc2+cLZr02448RnHDQ==
X-Gm-Gg: Acq92OGP50bcsR73Dt1JZYZLwar03pJh3r7BHWXvvYuaW6NLBkZCYKkM3UQb3n877jI
 sN3rJr2E/ZhZbei1gSJK6dW5obzgToxUQm+gkOBsud6Xbz7IH7Dj8d68nUIr7UmM/uFuJnGAhFc
 zUaSKg+mSsXlLQOH1DOcJr7DXrLASP8x27YRBH24pVXJzlqlBFlWg8A2hDWG+MbQu54d8qBXuc3
 OzCUtZj5ASSu9u4+SYQUX6Qy4PSemf910XNnvR7RlAmiOq1iAwPg+Ju4RlcwX67Jro06b+ixt2F
 n4KtcoiqG6QK5UphefzK+JwhnplUWaa7R9WOKv3rjX7FxmMEr0M=
X-Received: by 2002:a05:6402:a28f:10b0:68f:cc95:8c10 with SMTP id
 4fb4d7f45d1cf-68fcc958d67mr4733122a12.27.1780937980731; Mon, 08 Jun 2026
 09:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
 <ah2aVdlsLqy9aeHP@p14s> <aiWGyj0KJ5I3qB2U@shikoro>
In-Reply-To: <aiWGyj0KJ5I3qB2U@shikoro>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 8 Jun 2026 10:59:29 -0600
X-Gm-Features: AVVi8CcwpO8TWgrbg4_PbOp9RdoqmCMY43yWTQaZhbDIpKOVvdgwrhlxYa3LGgI
Message-ID: <CANLsYkxH+uOYH1RjDe0xnw6=jgg2ZRE8sScnCSzdk16vD64a_A@mail.gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailman-Approved-At: Tue, 09 Jun 2026 11:52:48 +0000
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 peng.fan@oss.nxp.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 imx@lists.linux.dev, Tanmay Shah <tanmay.shah@amd.com>,
 Frank Li <Frank.Li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Ben Levinsky <ben.levinsky@amd.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-renesas-soc@vger.kernel.org, daniel.baluta@nxp.com,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/5] remoteproc: cleanup shared
 carveout and resource-table helpers
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
Content-Type: multipart/mixed; boundary="===============7066182699383554057=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[mathieu.poirier@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:mcoquelin.stm32@gmail.com,m:festevam@gmail.com,m:magnus.damm@gmail.com,m:peng.fan@oss.nxp.com,m:geert+renesas@glider.be,m:imx@lists.linux.dev,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:ben.levinsky@amd.com,m:kernel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:daniel.baluta@nxp.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:wsa@sang-engineering.com,m:mcoquelinstm32@gmail.com,m:magnusdamm@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.nxp.com,glider.be,lists.linux.dev,amd.com,nxp.com,kernel.org,vger.kernel.org,st-md-mailman.stormreply.com,pengutronix.de,lists.infradead.org];
	DKIM_TRACE(0.00)[linaro.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,linaro.org:from_mime,mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A64ED65FAD4

--===============7066182699383554057==
Content-Type: multipart/alternative; boundary="000000000000b575510653c0ef9d"

--000000000000b575510653c0ef9d
Content-Type: text/plain; charset="UTF-8"

On Sun, 7 Jun 2026 at 08:57, Wolfram Sang <wsa+renesas@sang-engineering.com>
wrote:

>
> > Wolfram has already indicated he wanted to test these changes - Arnaud,
> Daniel
> > and Peng, please do the same for your platforms.
>
> Testing is more involved than I expected. Didn't work out this week.
> I'll keep trying for next week. But it may end up the week after that.
>

Given the potential repercussions and how late we are in the cycle, I will
wait for 7.2-rc1 to merge this set.  This will either be on June 29th or
July 6th.

--000000000000b575510653c0ef9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 7 Jun 2026 at 08:57, =
Wolfram Sang &lt;<a href=3D"mailto:wsa%2Brenesas@sang-engineering.com">wsa+=
renesas@sang-engineering.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><br>
&gt; Wolfram has already indicated he wanted to test these changes - Arnaud=
, Daniel<br>
&gt; and Peng, please do the same for your platforms.<br>
<br>
Testing is more involved than I expected. Didn&#39;t work out this week.<br=
>
I&#39;ll keep trying for next week. But it may end up the week after that.<=
br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Given the potential repercussions and how late we are in th=
e cycle, I will wait for 7.2-rc1 to merge this set.=C2=A0 This will=C2=A0ei=
ther be on June 29th or July 6th.</div><br></div><div>=C2=A0</div></div></d=
iv>

--000000000000b575510653c0ef9d--

--===============7066182699383554057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7066182699383554057==--
