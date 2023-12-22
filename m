Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE97822AB4
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 10:57:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46CCBC6DD82;
	Wed,  3 Jan 2024 09:57:57 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9CC9C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 13:16:51 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1d3e8a51e6bso14918395ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 05:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703251010; x=1703855810;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:msip_labels:content-language:accept-language
 :in-reply-to:references:message-id:date:thread-index:thread-topic
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DjPJ9sWP9JXfbKkMBosvS255CXXcmC47W0vobyopa6M=;
 b=T/612yFBQ60DWaLBzRYgKxF/lH3gtU7Mlz04xtbeYEIiQ754sfrJrB70hYQjIrgq4g
 mZYzIoEccm3FGU6im1oK4RPZmiQltixqw3pH50sJDh6UnoWsr8Zr8ffzOfuja+UoVgrv
 dbJhYVCrRZDzmapZjZeBx2cqo0a/YWi5DwXF0r3FiKuOYLg3fdBbrkx/1oW16dybySYM
 xmnhHOz+/hAQVY8RcguKcvlJwDqzg3Y9Z6eZxVlkKJa3A3lcg4gpg2L+3alGJIb1Rl8Q
 8A8WV6+uA1qd5QKSKoBtVVCq+bz2kC9aBhkLFYV5W8P/6t8mG1X/+mQDwiWP6rNJoEv3
 7G+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703251010; x=1703855810;
 h=mime-version:msip_labels:content-language:accept-language
 :in-reply-to:references:message-id:date:thread-index:thread-topic
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DjPJ9sWP9JXfbKkMBosvS255CXXcmC47W0vobyopa6M=;
 b=dnpQABcqsf/Mq8QZ58Pl91nCZ73yB1jAnx1hKaUBjWC4iAr/u3+da8aBzA+LRJr8BX
 ZdoO66SmNqLZrhcZvaHTf8MGkDFaoOQ7523m2QppXWyhA3S/agbximmtnfJDjFZPprSm
 qfH9irh24oXrfVhbTumEoq4myH0B8KbgkpRdjZC/okFKysY8UQM/BFSUCDJgeA56InrK
 0wRByCQ01rKZYjrd0Gh7JZMi9ilETwrp+JmhPsslbG1crSMKIMZ5upbslmJVKvDRPOCw
 w2b5lXgNsSux2km6v/lt56Dz+iQC5YF1NXFuZafg7LeyEtoi8Ex927h/8+KJprFwCGIB
 0NAQ==
X-Gm-Message-State: AOJu0YwGxSdJdDDrgifT7Mpc42s1D8FHAKxeu64jW66znhMiKCHJRlGS
 yH+TiPga9MxeEfpkESXpZLY=
X-Google-Smtp-Source: AGHT+IH1nzanWjoq/AV2vNMfnbWXU2Jmed/5E+9o5RQPftwGSn0Y2VFYiffDAF491AjJQmtH5y2NoA==
X-Received: by 2002:a17:902:db07:b0:1d4:299e:6c48 with SMTP id
 m7-20020a170902db0700b001d4299e6c48mr376804plx.24.1703251010001; 
 Fri, 22 Dec 2023 05:16:50 -0800 (PST)
Received: from SJ2PR22MB4554.namprd22.prod.outlook.com
 ([2603:1036:307:5468::5]) by smtp.gmail.com with ESMTPSA id
 q2-20020a170902dac200b001d3831aeb01sm3405551plx.183.2023.12.22.05.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 05:16:49 -0800 (PST)
From: Lucas Pereira <lucasvp@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, Household Cang <canghousehold@aol.com>
Thread-Topic: [PATCH net 0/1] Prevent DSA tags from breaking COE
Thread-Index: AXMuLTc2JQczYOGboCVGJ4kr8xc7vUFDQzQyZXhvMjLI13bsSA==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Fri, 22 Dec 2023 13:16:44 +0000
Message-ID: <SJ2PR22MB45547404DA1CA10A201B2BE0A294A@SJ2PR22MB4554.namprd22.prod.outlook.com>
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
 <0351C5C2-FEE2-4AED-84C8-9DCACCE4ED0A@aol.com>
 <20231222123023.voxoxfcckxsz2vce@skbuf>
In-Reply-To: <20231222123023.voxoxfcckxsz2vce@skbuf>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels: 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Jan 2024 09:57:54 +0000
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net 0/1] Prevent DSA tags from breaking COE
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
Content-Type: multipart/mixed; boundary="===============2626955916730868908=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============2626955916730868908==
Content-Language: pt-BR
Content-Type: multipart/alternative;
	boundary="_000_SJ2PR22MB45547404DA1CA10A201B2BE0A294ASJ2PR22MB4554namp_"

--_000_SJ2PR22MB45547404DA1CA10A201B2BE0A294ASJ2PR22MB4554namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Dear community collaborators,

First of all, I would like to thank you for the prompt response and the sug=
gestions provided.

We conducted the tests as indicated, but unfortunately, the problem persist=
s. It seems to me that if it were a Checksum-related issue, the behavior wo=
uld be different, as the VPN and communication work normally for several da=
ys before failing suddenly.

We have observed that the only effective ways to reestablish communication,=
 so far, are through a system reboot or by changing the authentication ciph=
er, such as switching from MD5 to SHA1. Interestingly, when switching back =
to the MD5 cipher, the communication fails to function again.

I am immensely grateful for the help received so far and would greatly appr=
eciate any further suggestions or recommendations that you might offer to r=
esolve this challenge.

Sincerely,

________________________________
De: Vladimir Oltean <olteanv@gmail.com>
Enviado: sexta-feira, 22 de dezembro de 2023 09:30
Para: Household Cang <canghousehold@aol.com>
Cc: Romain Gantois <romain.gantois@bootlin.com>; Alexandre Torgue <alexandr=
e.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>; David S. Miller <=
davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski <k=
uba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime Coquelin <mcoqueli=
n.stm32@gmail.com>; Miquel Raynal <miquel.raynal@bootlin.com>; Maxime Cheva=
llier <maxime.chevallier@bootlin.com>; Sylvain Girard <sylvain.girard@se.co=
m>; Pascal EBERHARD <pascal.eberhard@se.com>; Richard Tresidder <rtresidd@e=
lectromag.com.au>; netdev@vger.kernel.org <netdev@vger.kernel.org>; linux-s=
tm32@st-md-mailman.stormreply.com <linux-stm32@st-md-mailman.stormreply.com=
>; linux-arm-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.o=
rg>
Assunto: Re: [PATCH net 0/1] Prevent DSA tags from breaking COE

Hi Lucas,

On Thu, Dec 21, 2023 at 02:40:34AM -0500, Household Cang wrote:
> > On Dec 18, 2023, at 11:23 AM, Romain Gantois <romain.gantois@bootlin.co=
m> wrote:
> >
> > This is a bugfix for an issue that was recently brought up in two
> > reports:
> >
> > https://lore.kernel.org/netdev/c57283ed-6b9b-b0e6-ee12-5655c1c54495@boo=
tlin.com/
> > https://lore.kernel.org/netdev/e5c6c75f-2dfa-4e50-a1fb-6bf4cdb617c2@ele=
ctromag.com.au/
> >
> Add me in to be the 3rd report...
> RK3568 GMAC0 (eth1) to MT7531BE (CPU port)
> Current workaround for me is ethtool -K eth1 rx off tx off

Is "rx off" actually required, or just "tx off"?

> https://lore.kernel.org/netdev/m3clft2k7umjtny546ot3ayebattksibty3yyttpff=
vdixl65p@7dpqsr5nisbk/T/#t
>
> Question on the patch to be built: how would I know if my setup could
> take advantage of the HW checksum offload? RK3658=92s eth0 on stmmac is
> doing fine, and eth0 is not on a DSA switch. Does this mean eth1
> should be able to do hw checksum offload once the stmmac driver is
> fixed?

The MT7531BE switch requires transmitted packets to have an additional
header which indicates what switch port is targeted. So the packet
structure is not the same as what eth0 transmits.

Your GMAC datasheet should explain what packets it is able to offload
L4 checksumming for, quite plainly. Probably MAC + IP + TCP yes, but
MAC + MTK DSA + IP + TCP no.

The bug is that the network stack thinks that the GMAC is able to
offload TX checksums for these MTK DSA tagged packets, so it does not
calculate the checksum in software, leaving the task up to the hardware.
My guess is that the hardware doesn't recognize the packets as something
that is offloadable, so it doesn't calculate the checksum either, and
that's the story of how you end up with packets with bad checksums.

The patch to be built should analyze the packet before passing it to a
hardware offload engine which will do nothing. The driver still declares
the NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM features because it is able to
offload checksumming for _some_ packets, but it falls back to the
software checksum helper for the rest. This includes your MTK DSA tagged
packets. They can be checksummed in software even with the DSA tag added,
because that uses the more generic mechanism with skb->csum_start and
skb->csum_offset, which DSA is compatible with, just fine. The GMAC
driver, most likely because of the lack of hardware support, does not
look at skb->csum_start and skb->csum_offset (aka it does not declare
the NETIF_F_HW_CSUM feature), so it cannot offload checksumming for your
switch traffic unless that was specifically baked into the RTL.

More details in the "Switch tagging protocols" section of
Documentation/networking/dsa/dsa.rst.


--_000_SJ2PR22MB45547404DA1CA10A201B2BE0A294ASJ2PR22MB4554namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;">=
<span style=3D"letter-spacing: normal; font-family: S=F6hne, ui-sans-serif,=
 system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell,=
 &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quo=
t;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbo=
l&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: 400; c=
olor: rgb(55, 65, 81);">Dear
 community collaborators,</span></p>
<p style=3D"text-align: left; margin: 1.25em 0px; border-width: 0px; border=
-style: solid; border-color: rgb(217, 217, 227);">
<span style=3D"letter-spacing: normal; font-family: S=F6hne, ui-sans-serif,=
 system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell,=
 &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quo=
t;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbo=
l&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: 400; c=
olor: rgb(55, 65, 81);">First
 of all, I would like to thank you for the prompt response and the suggesti=
ons provided.</span></p>
<p style=3D"text-align: left; margin: 1.25em 0px; border-width: 0px; border=
-style: solid; border-color: rgb(217, 217, 227);">
<span style=3D"letter-spacing: normal; font-family: S=F6hne, ui-sans-serif,=
 system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell,=
 &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quo=
t;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbo=
l&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: 400; c=
olor: rgb(55, 65, 81);">We
 conducted the tests as indicated, but unfortunately, the problem persists.=
 It seems to me that if it were a Checksum-related issue, the behavior woul=
d be different, as the VPN and communication work normally for several days=
 before failing suddenly.</span></p>
<p style=3D"text-align: left; margin: 1.25em 0px; border-width: 0px; border=
-style: solid; border-color: rgb(217, 217, 227);">
<span style=3D"letter-spacing: normal; font-family: S=F6hne, ui-sans-serif,=
 system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell,=
 &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quo=
t;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbo=
l&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: 400; c=
olor: rgb(55, 65, 81);">We
 have observed that the only effective ways to reestablish communication, s=
o far, are through a system reboot or by changing the authentication cipher=
, such as switching from MD5 to SHA1. Interestingly, when switching back to=
 the MD5 cipher, the communication
 fails to function again.</span></p>
<p style=3D"text-align: left; margin: 1.25em 0px; border-width: 0px; border=
-style: solid; border-color: rgb(217, 217, 227);">
<span style=3D"letter-spacing: normal; font-family: S=F6hne, ui-sans-serif,=
 system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell,=
 &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quo=
t;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbo=
l&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: 400; c=
olor: rgb(55, 65, 81);">I
 am immensely grateful for the help received so far and would greatly appre=
ciate any further suggestions or recommendations that you might offer to re=
solve this challenge.</span></p>
<p style=3D"text-align: left; margin: 1.25em 0px; border-width: 0px; border=
-style: solid; border-color: rgb(217, 217, 227);" class=3D"elementToProof">
<span style=3D"letter-spacing: normal; font-family: S=F6hne, ui-sans-serif,=
 system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell,=
 &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quo=
t;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbo=
l&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: 400; c=
olor: rgb(55, 65, 81);">Sincerely,</span></p>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>De:</b>&nbsp;Vladimir=
 Oltean &lt;olteanv@gmail.com&gt;<br>
<b>Enviado:</b>&nbsp;sexta-feira, 22 de dezembro de 2023 09:30<br>
<b>Para:</b>&nbsp;Household Cang &lt;canghousehold@aol.com&gt;<br>
<b>Cc:</b>&nbsp;Romain Gantois &lt;romain.gantois@bootlin.com&gt;; Alexandr=
e Torgue &lt;alexandre.torgue@foss.st.com&gt;; Jose Abreu &lt;joabreu@synop=
sys.com&gt;; David S. Miller &lt;davem@davemloft.net&gt;; Eric Dumazet &lt;=
edumazet@google.com&gt;; Jakub Kicinski &lt;kuba@kernel.org&gt;; Paolo Aben=
i
 &lt;pabeni@redhat.com&gt;; Maxime Coquelin &lt;mcoquelin.stm32@gmail.com&g=
t;; Miquel Raynal &lt;miquel.raynal@bootlin.com&gt;; Maxime Chevallier &lt;=
maxime.chevallier@bootlin.com&gt;; Sylvain Girard &lt;sylvain.girard@se.com=
&gt;; Pascal EBERHARD &lt;pascal.eberhard@se.com&gt;; Richard Tresidder
 &lt;rtresidd@electromag.com.au&gt;; netdev@vger.kernel.org &lt;netdev@vger=
.kernel.org&gt;; linux-stm32@st-md-mailman.stormreply.com &lt;linux-stm32@s=
t-md-mailman.stormreply.com&gt;; linux-arm-kernel@lists.infradead.org &lt;l=
inux-arm-kernel@lists.infradead.org&gt;<br>
<b>Assunto:</b>&nbsp;Re: [PATCH net 0/1] Prevent DSA tags from breaking COE=
</span>
<div>&nbsp;</div>
</div>
<div><span style=3D"font-size: 11pt;">Hi Lucas,<br>
<br>
On Thu, Dec 21, 2023 at 02:40:34AM -0500, Household Cang wrote:<br>
&gt; &gt; On Dec 18, 2023, at 11:23 AM, Romain Gantois &lt;romain.gantois@b=
ootlin.com&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; This is a bugfix for an issue that was recently brought up in two=
<br>
&gt; &gt; reports:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://lore.kernel.org/netdev/c57283ed-6b9b-b0e6-ee12=
-5655c1c54495@bootlin.com/" id=3D"OWAe7ccc5f7-11c1-265c-11c3-a2b0078e3893" =
class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://lore.kernel.org/netdev/c57283ed-6b9b-b0e6-ee12-5655c1c54495@bootlin=
.com/</a><br>
&gt; &gt; <a href=3D"https://lore.kernel.org/netdev/e5c6c75f-2dfa-4e50-a1fb=
-6bf4cdb617c2@electromag.com.au/" id=3D"OWA98dd2bb6-a728-89ce-9b82-e736c8c3=
a1b3" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://lore.kernel.org/netdev/e5c6c75f-2dfa-4e50-a1fb-6bf4cdb617c2@electro=
mag.com.au/</a><br>
&gt; &gt;<br>
&gt; Add me in to be the 3rd report...<br>
&gt; RK3568 GMAC0 (eth1) to MT7531BE (CPU port)<br>
&gt; Current workaround for me is ethtool -K eth1 rx off tx off<br>
<br>
Is &quot;rx off&quot; actually required, or just &quot;tx off&quot;?<br>
<br>
&gt; <a href=3D"https://lore.kernel.org/netdev/m3clft2k7umjtny546ot3ayebatt=
ksibty3yyttpffvdixl65p@7dpqsr5nisbk/T/#t" id=3D"OWA6dd821ba-da59-5b50-7600-=
b71070bc3379" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://lore.kernel.org/netdev/m3clft2k7umjtny546ot3ayebattksibty3yyttpffvd=
ixl65p@7dpqsr5nisbk/T/#t</a><br>
&gt;<br>
&gt; Question on the patch to be built: how would I know if my setup could<=
br>
&gt; take advantage of the HW checksum offload? RK3658=92s eth0 on stmmac i=
s<br>
&gt; doing fine, and eth0 is not on a DSA switch. Does this mean eth1<br>
&gt; should be able to do hw checksum offload once the stmmac driver is<br>
&gt; fixed?<br>
<br>
The MT7531BE switch requires transmitted packets to have an additional<br>
header which indicates what switch port is targeted. So the packet<br>
structure is not the same as what eth0 transmits.<br>
<br>
Your GMAC datasheet should explain what packets it is able to offload<br>
L4 checksumming for, quite plainly. Probably MAC + IP + TCP yes, but<br>
MAC + MTK DSA + IP + TCP no.<br>
<br>
The bug is that the network stack thinks that the GMAC is able to<br>
offload TX checksums for these MTK DSA tagged packets, so it does not<br>
calculate the checksum in software, leaving the task up to the hardware.<br=
>
My guess is that the hardware doesn't recognize the packets as something<br=
>
that is offloadable, so it doesn't calculate the checksum either, and<br>
that's the story of how you end up with packets with bad checksums.<br>
<br>
The patch to be built should analyze the packet before passing it to a<br>
hardware offload engine which will do nothing. The driver still declares<br=
>
the NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM features because it is able to<br>
offload checksumming for _some_ packets, but it falls back to the<br>
software checksum helper for the rest. This includes your MTK DSA tagged<br=
>
packets. They can be checksummed in software even with the DSA tag added,<b=
r>
because that uses the more generic mechanism with skb-&gt;csum_start and<br=
>
skb-&gt;csum_offset, which DSA is compatible with, just fine. The GMAC<br>
driver, most likely because of the lack of hardware support, does not<br>
look at skb-&gt;csum_start and skb-&gt;csum_offset (aka it does not declare=
<br>
the NETIF_F_HW_CSUM feature), so it cannot offload checksumming for your<br=
>
switch traffic unless that was specifically baked into the RTL.<br>
<br>
More details in the &quot;Switch tagging protocols&quot; section of<br>
Documentation/networking/dsa/dsa.rst.<br>
<br>
</span></div>
</body>
</html>

--_000_SJ2PR22MB45547404DA1CA10A201B2BE0A294ASJ2PR22MB4554namp_--

--===============2626955916730868908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2626955916730868908==--
