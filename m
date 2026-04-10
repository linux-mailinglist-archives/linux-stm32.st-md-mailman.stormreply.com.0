Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNs9OPJl2Wm8pQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 23:04:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 714083DCB29
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 23:04:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22994C8F26F;
	Fri, 10 Apr 2026 21:04:50 +0000 (UTC)
Received: from mail-vs1-f100.google.com (mail-vs1-f100.google.com
 [209.85.217.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7841DC87EC2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 21:04:48 +0000 (UTC)
Received: by mail-vs1-f100.google.com with SMTP id
 ada2fe7eead31-6058ac0ebceso1573781137.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 14:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775855087; x=1776459887;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D4tCjoHdgyNFhI8wTr/fqtw68RhuJ9aTlBBzWo4c/io=;
 b=SYz59Ut/3YE9h07k5Ng/tT1I695heSElt/8I7hLL4B9fqACit+UHPgKqL0RbADmLCv
 4hTKcnpXGa5shXZ2X7jtTQAKU0/FUOEgLSM5biMXrZ8+2yLYa2hRf0ZIaCaD5Tk0jbhY
 fuP7mzSlg6LJJHYUvin+GT7iNftE78DDrSubXVhm6jFfhw64Xn6m38jny1Rcwk8k5lQh
 Mbu+mZi5CNki/mbp6GmSfDewamYupEvQ/v0g5WK+H/ITFv8h9e13ypZkfyWgLSK+EGc0
 /wAmPXQ9NocQp/kPjnYc16vu9j9Thc3ZiA2KE1a6GK4Yv4vTjL6EO0eTssTiQgEcx6Xh
 yyfg==
X-Forwarded-Encrypted: i=2;
 AJvYcCVgbskti87+6KEudeqO/mK1FQ8XYKHmwFlKNIfd/fsEJN1B7pZmmLx2tWQdkMDOjFBlBD0020nBx1/xhw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxUyX2Y560vsRL4oAah0Gg4bMF8RQr/4N8CHYqIz+8fo9LHtTih
 hPawCfsbEAMXmKoDKimSvFjBT+oGxFdajyoE8t2I4zJNehPMTJ5A2GR0RxK4DPC48Id0DPiqHmV
 e0eVpnP/Iw4FnKBv7vUo13q4OLFpnvXlPHtIkW16K6GKvRZ+V0M1fWYhBzygGvFksE6UDUfU9xo
 mPH6+itVjvAo3bSPm+435s3EcB2UFrw5Nq6qU0ZYitHN/bxaJRmK6NJxQiF/5BovocuQxFdUrKh
 UmBUZgbltsy84UBln2rxPSf89bNx7tPi4Cn4mHXQQ==
X-Gm-Gg: AeBDiesvaffe+DoLg+YAN/uq12AOvx2PUIPFm9ShYO4G1wUCgumWofEtMM5aWHK0qc4
 FDvPhhnLVeWnQvSEzywM8ARgc/s/sy2VQyqJPhPcmZ61ZTU4Z3WxVHy6ae2vbC1rR2jOVei2dS+
 aHSCDWSLGirpJ0daGN7xWuBFDWKCivn0u+ajRNZcjF7dLwTJlzjFmqnbQ6jXBPmrpj7IFiKZRJn
 QuatbCTrJskYp4Z1zDiOzGtDNFW0o3RPhe1ufyRVd5ymM2NnVxT6cjT4cUZvmVSbk1f1msiy1c0
 hvBuWFKff4Fzq/Cr5jW0zsYw+1MejiGnB9UQeA7ik6e/5HkCG7/waCMP55CO8T7DpChqFuSj0ay
 Z1hM/64xckepkvFwdU4ZZuywvQDMJpiGGV88k8alqPwVxG/VzLeyOLRFZc7ejR2GipIet5NrfZ5
 NZOxwtJgP46UYjJO704pIwNJ8kJwVc8bhECQ0LWTSbIvbSsotcSPxgG2qHBBzNfu0=
X-Received: by 2002:a05:6102:3352:b0:604:f29d:84be with SMTP id
 ada2fe7eead31-609fe5841b1mr2475897137.3.1775855087084; 
 Fri, 10 Apr 2026 14:04:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-24.dlp.protect.broadcom.com. [144.49.247.24])
 by smtp-relay.gmail.com with ESMTPS id
 ada2fe7eead31-609d8c5bbd3sm293237137.3.2026.04.10.14.04.46
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Apr 2026 14:04:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-43d1bfbd219so1832660f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 14:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775855085; cv=none;
 d=google.com; s=arc-20240605;
 b=d88ZoQ1+uQpPSsMtrTfXPRFpdEhMCl1JPhuZpJuyS2FDl9bpc4DkKFKq8U0oqKDHil
 /uNK3EBqJKYumJlibkyy21XQZXtmCF4eJeMKYXyM5OTuz//Dlri+4f8JkehIuMW/nbuq
 rIwDChWfOYZCc8FkXdBGtx03dDVXCMaH/IIMd330H6BWwiDcJrg9cI2YT0Ib/+l7hcBq
 cc0PUFS0IsNg0TJH2+cYd4WSkSe/e+kre+SP2vcuwBv/GKPI6wkR2NgG+bjkDPoDRAuj
 fQu/RUE8WjEY8ZSo4+urQzEDABi18jVk47qACz09h4Gk6nW2ewXXFcFTxf3/iIQqEM4L
 gYeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=D4tCjoHdgyNFhI8wTr/fqtw68RhuJ9aTlBBzWo4c/io=;
 fh=WDuY+ryDfctqZp4CnXG5I70jM+g4VHsyfloc9mwMZZ0=;
 b=HqrKqDjr7a0eGP/uVfhe445G93nnuZQ1ISA0/T8pKe+ARIutqXZ63h42zZX6mi/oLp
 FC9S/A/66Y4ZFfw+EYuoLuun/UoZBUvMahTx60fvEdrOP4QU9Cexls9032bnSokLQf4Y
 oixjTc5NewBcmPhlf/MDuN8M4PNhcZFe47Vjf3QMBj3GFLdQaRh/c2BtaZyKhnbbmao+
 nlWd8jFVn19BxqUVmnUSwBCwsZISPZTsUjQtESbuQXQd/ZPP1W0OOaTyK0uWEEedJBNp
 /uq+jcfoEVV6cc64SC4MgtwwC5PDDAYg5O2rlwsDIyF2Muipcp4PIuUzGC7i1pfIfH0h
 zVQw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1775855085; x=1776459885;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D4tCjoHdgyNFhI8wTr/fqtw68RhuJ9aTlBBzWo4c/io=;
 b=Xl9EFJGrsL6wlW17xQEN7ZkuW7VZvMlm83WJyzJuCyxV/JJGPu+iMiMUN2WD7oTUl9
 btF62uUr3bv0S+UbIYkb/uDMT+w4sG2zQFLcUwXr5w8rzTeImctt2WIhJlfnX2BRtObA
 RZS9PQNgtXR75ycmc1nDwZsdESSO/A59MG8Bc=
X-Forwarded-Encrypted: i=1;
 AJvYcCVP79dPBsXAlDETF15pPW9anXw8Ml+vjCfigg+eOWI+APRfGIolnh4+PsFpyjGZOcvyfdXeyA5EJOgLXw==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6000:2906:b0:439:fbbc:d593 with SMTP id
 ffacd0b85a97d-43d642c7a90mr6978475f8f.27.1775855085562; 
 Fri, 10 Apr 2026 14:04:45 -0700 (PDT)
X-Received: by 2002:a05:6000:2906:b0:439:fbbc:d593 with SMTP id
 ffacd0b85a97d-43d642c7a90mr6978440f8f.27.1775855085044; Fri, 10 Apr 2026
 14:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
 <E1wAPBR-0000000F7ju-1fD9@rmk-PC.armlinux.org.uk>
 <CAMdnO-+TK65AxjTsDd017Mhop+VC3Xf8jtfaTXYpE6wBNZOt4g@mail.gmail.com>
 <adi3Vks-N0a83ylE@shell.armlinux.org.uk>
In-Reply-To: <adi3Vks-N0a83ylE@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Fri, 10 Apr 2026 14:04:32 -0700
X-Gm-Features: AQROBzA8eu5WjtBEGnB0inAkAMz407HE65PW9MMqp4ETiWDYykwhH2trVnWL8Yg
Message-ID: <CAMdnO-KLJrbTxaXrfs_s1G=rn0PjSrQ3cdYHjrnmvXdPJ7=B9Q@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 02/10] net: stmmac: rename
	dev_id to userver
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
Content-Type: multipart/mixed; boundary="===============4183554850000582981=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.19 / 15.00];
	DMARC_POLICY_REJECT(2.00)[broadcom.com : SPF not aligned (relaxed),reject];
	SIGNED_SMIME(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[broadcom.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,armlinux.org.uk:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 714083DCB29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============4183554850000582981==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000091ad73064f217b26"

--00000000000091ad73064f217b26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 1:39=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Apr 09, 2026 at 04:07:42PM -0700, Jitendra Vegiraju wrote:
> > Hi Russell,
> >
> > On Wed, Apr 8, 2026 at 2:27=E2=80=AFAM Russell King (Oracle)
> > <rmk+kernel@armlinux.org.uk> wrote:
> > >
> > > The Synopsys Databook and several implementation TRMs identify bits
> > > 15:8 of the version register in dwmac v3.xx and v4.xx as "userver".
> > > We even print its value with "User ID". Rather than using "dev_id",
> > > use "userver" instead.
> > >
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/hwif.c | 18 +++++++++---------
> > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net=
/ethernet/stmicro/stmmac/hwif.c
> > > index 3774af66db48..830ff816ab4f 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > > @@ -15,7 +15,7 @@
> > >
> > >  struct stmmac_version {
> > >         u8 snpsver;
> > > -       u8 dev_id;
> > > +       u8 userver;
> > >  };
> > From the XGMAC databook that I have access to bits(15:8) identify the
> > DEVID field of MAC_version register.
> > The userver field is from bits(23:16) of the same register. This is a
> > customer defined field (configured with coreConsultant).
> > Currently stmmac doesn't care about bits(23:16).
>
> Thanks for the additional information.
>
> I don't have any XGMAC documentation, but this indicates that it differs
> between XGMAC and previous cores - GMAC and GMAC4 cores, 15:8 are
> documented as userver, and 31:16 are marked as reserved.
>
> Note that the dev_info() also prints 15:8 as "User ID" not "Device ID".
>
> To confirm, is the XGMAC version register at offset 0x20 ? Later GMAC
> cores moved it to 0x110.
The XGMAC version register is at offset 0x110.

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--00000000000091ad73064f217b26
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGbTCCBFWg
AwIBAgIMGHX6KxYK3WW2YyprMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MDkyNTEzNTAzMVoXDTI2MDkyNjEzNTAzMVowgbMxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjEaMBgGA1UEAxMRSml0ZW5kcmEgVmVnaXJhanUx
LTArBgkqhkiG9w0BCQEWHmppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNvbTCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAKWV+9PYvG4njqRsbQas79f8Q46VL7b1ZxvWT6ik6VMbdRZx
tfpfZalVXksqcb02/N1H7UA9V04cV2q97FkSr/KxeFLMetPb3cVJZICg23IRO2NTPdmgPFzwkPTo
35h9h/OYLgh3/9a1nTsC2xqJa8GtohD5+42rsskGcI57U4n1r1L4R5IL9ypSqDxX/xVEAdGI5FTj
VgvoZC6iuEbnez+yO8TT3wun9b/PQowOB5P0CwIFv7ERW0S1s6B8yrbsoaTrz0vQaEA786k1pZkg
ykC1+zXq/iTyZuPP4B4RkzFd43Pw+GAH0Tt2nx5V4rNisJHeAVNU92Gj01cEg0I+FnsCAwEAAaOC
Ad8wggHbMA4GA1UdDwEB/wQEAwIFoDCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0
dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQw
OQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAy
MzBlBgNVHSAEXjBcMAkGB2eBDAEFAwEwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIw
ADBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWlt
ZWNhMjAyMy5jcmwwKQYDVR0RBCIwIIEeaml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tMBMG
A1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1Ud
DgQWBBRq5Jlxz3MqC+zEgUxK566xEc2g3DANBgkqhkiG9w0BAQsFAAOCAgEARXrmeeWA31pp9Tr0
M6mOlMv+Pr2raES4GzPSyftvxf6tBQCBNaqi6LSbyusDYOj3mG9bp6VeVn+68OxNY9iNAk+ujtId
f3+30BlZOQ1v8z9u2peUOUtWI60y2MxhdH0X0n2H+BCGvUOFqs5z440jqqy1HsscZTXHB7FEZmVP
fyD+0Z6cxyh7WNC6+BgLiFwf8iqmAbu7Yb1sGTUGyS5gfYEjJbF2PJfwNUcJDd7eS4w5Ju5mK5y7
spgjH2/JmDgbkpSk9JyuWfjGZIg4ah/q2nb6UMd1XJb6gLQZuzPOI3SgXPvd8MHGjKZrX2BHOBSC
bJJ8rp4w4a9QMS6dde2MFObusxkZAft4tUnwo+ProchHs7iA85sL7sWEZhAmjmKKCpECpEfZm0+/
hpvKQV3AZp5vBstb4IVL8QmLj8beDVHYnNhEicsSiG1wW7zSYyBnmGbFRrFQIJnJDWPjTZOlVEyp
T1ShrXRCtqJpOt6rgg+rFEY3D8j6/bAkJXnmKnE2LZ0YyrrKk7eC6UfNNimx38w3NWchtcGY8zJn
Y/1/C9Jv/mWm/2lK8nvusOFxhKmbG83Hx8toQdZ5F1kYk6zAWjfB7lwXr/En9mCmLieJ18hen9EK
qbYyUkmCmuoLi5GXFMJy+iQv6DgMVQ7CACagybU6FUrmL9lVa+A6caBEEh4xggJXMIICUwIBATBi
MFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9i
YWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwYdforFgrdZbZjKmswDQYJYIZIAWUDBAIBBQCg
gccwLwYJKoZIhvcNAQkEMSIEIKxBtT0XlPEv1PRsOCxZHhJYg42Fs8dobavsL5g3SDEOMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDQxMDIxMDQ0NVowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAILUmmdUnbCi
svOMN5GzRsAnnHC/ePzlXygRZO+Zdm7EmvwRDvIpqiEeUfmUntSdzpTaJGxv3FbR2YKwjStGOc/h
UOEMNsUETQ7SLyax3C3l7eCgP1DgiRyvU7cSB7mazCeT/J+OfR5EG8oYqH4yRg5P6VMcQgsxV7KC
wO95XWDE5HZNl4/EYGa5fafsCCFtio7ufT3jwkODFBEyDZN0/2pI2QXQWsa1nTmzhjGeErpSy30i
T6imGNcUTh1wowtePiB1rNMMDfU/OpfAV6FCxAopCR7Y8YiRvZAz0e0rwYyhfKny6dhnhWMIQ3a4
W2YQBOq/VgBhMd1VqWCwkU067y0=
--00000000000091ad73064f217b26--

--===============4183554850000582981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4183554850000582981==--
