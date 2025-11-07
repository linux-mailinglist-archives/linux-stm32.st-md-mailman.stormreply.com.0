Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF22C40F89
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 18:00:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50758C290A0;
	Fri,  7 Nov 2025 17:00:54 +0000 (UTC)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FDC8C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 17:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 40DC22B03EC;
 Fri,  7 Nov 2025 18:00:52 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id unQib7SRf0dx; Fri,  7 Nov 2025 18:00:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B1A9211C056;
 Fri,  7 Nov 2025 18:00:51 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sfuXiBmx0k1b; Fri,  7 Nov 2025 18:00:51 +0100 (CET)
Received: from ehlo.thunderbird.net (089144205041.atnat0014.highway.webapn.at
 [89.144.205.41])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 3C81511C04B;
 Fri,  7 Nov 2025 18:00:51 +0100 (CET)
Date: Fri, 07 Nov 2025 18:00:50 +0100
From: Richard Weinberger <richard@nod.at>
To: Markus Elfring <Markus.Elfring@web.de>,
 Liyuan Pang <pangliyuan1@huawei.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
User-Agent: K-9 Mail for Android
In-Reply-To: <7857ab09-7808-4abe-9df1-66235291436b@web.de>
References: <20251107100057.1091153-1-pangliyuan1@huawei.com>
 <7857ab09-7808-4abe-9df1-66235291436b@web.de>
Message-ID: <DF8B15D4-4819-47E6-9BB0-268AD0204C86@nod.at>
MIME-Version: 1.0
Cc: Yang Liu <young.liuyang@huawei.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, wanqian10@huawei.com
Subject: Re: [Linux-stm32] [PATCH v2] ubi: fastmap: fix ubi->fm memory leak
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
Content-Type: multipart/mixed; boundary="===============8795463142704730221=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============8795463142704730221==
Content-Type: multipart/alternative;
 boundary=----76SO26UDBHUJDVUQ1D5SO3ARQABOKZ
Content-Transfer-Encoding: 7bit

------76SO26UDBHUJDVUQ1D5SO3ARQABOKZ
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Liyuan,

Feel free to ignore everything Markus says=2E
Markus, please stop it=2E Really=2E


Am 7=2E November 2025 13:13:28 MEZ schrieb Markus Elfring <Markus=2EElfrin=
g@web=2Ede>:
>> The problem is that scan_fast() allocate memory for ubi->fm
>> and ubi->fm->e[x], but if the following attach process fails
>=E2=80=A6
>
>You may occasionally put more than 60 characters into text lines
>of such a change description=2E
>https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=2Egit/=
tree/Documentation/process/submitting-patches=2Erst?h=3Dv6=2E18-rc4#n658
>
>Regards,
>Markus

------76SO26UDBHUJDVUQ1D5SO3ARQABOKZ
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div dir=3D"auto">Liyuan,<br><br>Feel free to igno=
re everything Markus says=2E<br>Markus, please stop it=2E Really=2E<br></di=
v><br><br><div class=3D"gmail_quote"><div dir=3D"auto">Am 7=2E November 202=
5 13:13:28 MEZ schrieb Markus Elfring &lt;Markus=2EElfring@web=2Ede&gt;:</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; =
border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail"><blockquote class=3D"gmail_quote" style=3D"margin: 0=
pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"><di=
v dir=3D"auto">The problem is that scan_fast() allocate memory for ubi-&gt;=
fm<br>and ubi-&gt;fm-&gt;e[x], but if the following attach process fails<br=
></div></blockquote><div dir=3D"auto">=E2=80=A6<br><br>You may occasionally=
 put more than 60 characters into text lines<br>of such a change descriptio=
n=2E<br><a href=3D"https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torv=
alds/linux=2Egit/tree/Documentation/process/submitting-patches=2Erst?h=3Dv6=
=2E18-rc4#n658">https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvald=
s/linux=2Egit/tree/Documentation/process/submitting-patches=2Erst?h=3Dv6=2E=
18-rc4#n658</a><br><br>Regards,<br>Markus<br></div></pre></blockquote></div=
></body></html>
------76SO26UDBHUJDVUQ1D5SO3ARQABOKZ--

--===============8795463142704730221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8795463142704730221==--
