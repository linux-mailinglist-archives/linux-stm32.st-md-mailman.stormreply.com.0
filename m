Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGPzIshnuGlEdgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 21:27:52 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3402A031C
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 21:27:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE521C87ED8;
	Mon, 16 Mar 2026 20:27:51 +0000 (UTC)
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com
 [209.85.214.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4748DC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 20:27:50 +0000 (UTC)
Received: by mail-pl1-f226.google.com with SMTP id
 d9443c01a7336-2b05761bec1so343625ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 13:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773692868; x=1774297668;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=No3rHexpPPp6HPQScahoxNpZIy8CzdAU7PUnwsKuD5k=;
 b=WmI40GOd/TC4R9vRvON2lMIsthpFxmyOYl+a+8ljoQpfneaT4vahybmkt0+kPgiUuE
 nAnzkx7qR2/l0DWMS8g0V3+zApOfTwrzY8sdImyxNCaGDRZeKXe5WhfUVAgbtc0o4PEq
 Ywidn0J4Y0X/eLiSEHBGR4ITQcC4i4oG38o7WzzoBZuqLh7aIP/sBAxzqnB2h/ol5e1U
 VHkRDvoxdmSghSEtrgrEAeeg2gA+19R9LiM4vvZyqYxWMFkepUnfexVdL2aYzZIH8/jC
 zzvpbb7MJaB6xtQeF0pV3pUYHSyiwq9lUpFDYJqE13YDFx1I5hgqCIA+bCTKb3vD+3Y0
 zsdQ==
X-Forwarded-Encrypted: i=2;
 AJvYcCUrVDXz3dijDFxnr9gDbICVK4xHnumPSooSp/Q1ChLnLO8AgyaC/lDZNs/BeA7MsaRffAbKoZrEuaPqQA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyRGpiTASrhKF1DJb7l4fr1kQWxbpUN3/yiavAlB4OpfnzAmbdP
 g4TugvNw6/K3jb2U2PumJV648RKnQvIky7lIH4gZtMcKLMyNVCQXnwKUkvnB4wFCrQ6JQni6BrJ
 ZtrA5lfGVHq1BRMhHiSSwUTCQg72cZ7ZcanxPAXMqvtTYmSqXAxHA4lFZ5isa0nC3ssH9O16Y8Z
 V/5e4anOLiiDTpwArIc9MpufjYPss9Ot91OLO+HdAXp3J8GY0HCcviMfZcAa8/t6qs6cwQgUF8o
 7iFgB1/s0Jz3Fr3clSnOVpQ8+Dp47jyGcHYmtGE3g==
X-Gm-Gg: ATEYQzzCVQ8ganFGrSe9YrGTyG5QhVmfSVucC8LhnvewsztF5sjQbNAuEjPCVnO8VJ9
 nPtNEsfABKdpxcB5FYmWYmjE7RuWo81oiOo5YUrX5oDLXERZFBcPvrxEg1pH1Qe7jbpBIhhfqeh
 cSJrLYJccSXqsirKxg4z/Iu8hmhNR6iXEwYFj4tDXLSlohu9XkSSMWfbU0BQraZS0HvMpMX3+La
 gg1HqGkzfoi5/kipXU1Er0dCa09RMj7fl6ibg4i3wS0Bta4GW6pVZc8LrYxr8Xd/b0DtwimvVJk
 8BDAJ6ZsOsi5ssS4XJirZA7nJcwjDP1OgKkEQaJWXE66tMDnQpFehtOsiDO5hv+Qt+QWKS/nkBP
 IANPv9GvYqWovs8wI2UGjqdkz4sXWrED6wi7gqysZ+o5R6V9GfRps2SQeZJrYiVZiKwUa4IJaUU
 OccWYSTaWnOH2f/k0u+5jyqQBss79EXpYsjMQUlOBUYVu74vz4hQcn+wNJZpbUPT4=
X-Received: by 2002:a17:902:d54d:b0:2b0:62cf:3537 with SMTP id
 d9443c01a7336-2b0635d8d06mr8716035ad.6.1773692868366; 
 Mon, 16 Mar 2026 13:27:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-2b054bb40ffsm6083255ad.42.2026.03.16.13.27.47
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Mar 2026 13:27:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-43b46b2b161so1294257f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 13:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773692866; cv=none;
 d=google.com; s=arc-20240605;
 b=AtWb2CMrqut5a+R8hfR4heoTiqAyI01BnY5/MUQ+MFVjEz2QICmF0qWXye4MH26DWM
 GMAXPbmlWdQKBrZnADvNjBXiP8pXvSemU0f2mZq4/vBPyr6CTPZjJG3vgcNnEBbbJPf5
 +NI76OrPYn+OQkHVXSXOAM5Yy0p6gJla9Ur4BWLH692W/Dw87PEq88aaLLBKMUfa+4Cu
 oj/8RM7ILCmUOrNZg7PFMKmo9OnSRWzesTY19EjQTvFOq9u8F/aFdBpFXT25PMcy5x4c
 +uJK0+y+VFu8TfRHk2lwQw7l/+01OWGuu/rFcTTdtodUkp41TeqlxSK4/BxG66ikjwkd
 R+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=No3rHexpPPp6HPQScahoxNpZIy8CzdAU7PUnwsKuD5k=;
 fh=NRGTwiJsCiNnPPZK3bw9sIXYR1U1XZOfjnauYwFBLbw=;
 b=chzdMzlyS+rGIfLFO0XUZmPVmgc07FQ0UEi9ns57pMj1kUPao2FAkYpiWGm2wCkJFt
 q7Cm/7yxhUlfidMgKBxd+kfS+MhYBt1KlyEH5JfO/8CPCLEANowOnav+DjNeuXRH7g3Q
 Fo6cxDvOo3vBCXIyZqnRmkoZ3nYfRXcOIzcTkGDhe5VopG9r0Qht4u4pE2jBNPwm0Ems
 6E3O/6V+SEaN6y2SDTqybnOi7wGwDlqbARjbZs9GxDpueLwIjdVq15277eeJKjzFOTVj
 ngbFgY38EjYqLmb4GDfmORxXtT5MdhHEbLDkIdel+jop6VAQKEe3cUqTJBdp6IYMx5Ys
 KnVA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1773692866; x=1774297666;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=No3rHexpPPp6HPQScahoxNpZIy8CzdAU7PUnwsKuD5k=;
 b=O1gPa5XL6q4hRcd7vQR+o4a1RvvORkf828OG0cOZ6lJb46CrLeS5lAoNZclBRaSlWX
 Ogp2epqrl2FGJQ9ezhqc56NB5pUtS0zhB9u7G3+AXWYowuh7SiCwaD0Oom4yWBGwC7Ac
 zCFTQYj9dQGJkgwVworIePpLPwhFPNR7lwUcY=
X-Forwarded-Encrypted: i=1;
 AJvYcCUY/c13k8XZ9Ibs/EdGwtIefBkMMAarK+Q2zz+1g9cTbGJw/tUoRjjbkO+dBEXlhspBFg0wty9skltNQg==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6000:2403:b0:439:c5cf:fc73 with SMTP id
 ffacd0b85a97d-43a04d7a050mr25499224f8f.12.1773692865745; 
 Mon, 16 Mar 2026 13:27:45 -0700 (PDT)
X-Received: by 2002:a05:6000:2403:b0:439:c5cf:fc73 with SMTP id
 ffacd0b85a97d-43a04d7a050mr25499179f8f.12.1773692865235; Mon, 16 Mar 2026
 13:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
 <20260313222206.778760-3-jitendra.vegiraju@broadcom.com>
 <abSaKe3d4fcBMqLm@shell.armlinux.org.uk>
 <CAMdnO-+UEb8sVf8=Aj7G6UgY-DxWe3bFYbSbKJRdU4woEX+dWQ@mail.gmail.com>
In-Reply-To: <CAMdnO-+UEb8sVf8=Aj7G6UgY-DxWe3bFYbSbKJRdU4woEX+dWQ@mail.gmail.com>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Mon, 16 Mar 2026 13:27:33 -0700
X-Gm-Features: AaiRm53K7fiQEZkpJI-MOvV-cHRkeznqwMJWGxhDHPBRcNZi_mzV70LOImU7VIY
Message-ID: <CAMdnO-La1d7AfqLHPxTX0Y3_17Cpn6SeAqFgW-vJUg+2OZp-xA@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Cc: quic_abchauha@quicinc.com, me@ziyao.cc, chenchuangyu@xiaomi.com,
 edumazet@google.com, lizhi2@eswincomputing.com, yangtiezhu@loongson.cn,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 bcm-kernel-feedback-list@broadcom.com, vladimir.oltean@nxp.com,
 kuba@kernel.org, pabeni@redhat.com, hawk@kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 ast@kernel.org, wens@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, horms@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net, ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net-next v7 2/5] net: stmmac: Add DW25GMAC
 support in stmmac core driver
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
Content-Type: multipart/mixed; boundary="===============3094140053938172811=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.19 / 15.00];
	DMARC_POLICY_REJECT(2.00)[broadcom.com : SPF not aligned (relaxed),reject];
	SIGNED_SMIME(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[broadcom.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.20)[multipart/mixed,multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:quic_abchauha@quicinc.com,m:me@ziyao.cc,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:vladimir.oltean@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:davem@davemloft.net,m:ovidiu.panait.rb@renesas.com,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,m
 :andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[quicinc.com,ziyao.cc,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,broadcom.com,nxp.com,redhat.com,altera.com,bp.renesas.com,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	NEURAL_HAM(-0.00)[-0.317];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2D3402A031C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============3094140053938172811==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000003b0679064d2a0d8a"

--0000000000003b0679064d2a0d8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, missed one answer in the previous response.
On Mon, Mar 16, 2026 at 1:14=E2=80=AFPM Jitendra Vegiraju
<jitendra.vegiraju@broadcom.com> wrote:
>
> Hi Russell,
> Thank you for reviewing the patches.
>
>
> On Fri, Mar 13, 2026 at 4:14=E2=80=AFPM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Fri, Mar 13, 2026 at 03:22:03PM -0700, \Jitendra Vegiraju wrote:
> > > @@ -42,13 +42,18 @@
> > >  #define DWXGMAC_CORE_2_20    0x22
> > >  #define DWXLGMAC_CORE_2_00   0x20
> > >
> > > +#define DW25GMAC_CORE_3_20   0x32
> > > +#define DW25GMAC_CORE_4_00   0x40
> > > +
> >
> > Do these live in the same versioning numberspace as DWXGMAC and
> > DWXLGMAC?
> >
Yes. We were informed by Synopsys that 0x32 is an early adopter
release and 0x4x is general availability release for DW25GMAC.
Device ID value for 25GMAC is 0x55.

> > > +int dw25gmac_setup(struct stmmac_priv *priv)
> > > +{
> > > +     struct mac_device_info *mac =3D priv->hw;
> > > +
> > > +     dev_info(priv->device, "\tDW25GMAC\n");
> > > +
> > > +     priv->dev->priv_flags |=3D IFF_UNICAST_FLT;
> > > +     mac->pcsr =3D priv->ioaddr;
> > > +     mac->multicast_filter_bins =3D priv->plat->multicast_filter_bin=
s;
> > > +     mac->unicast_filter_entries =3D priv->plat->unicast_filter_entr=
ies;
> > > +     mac->mcast_bits_log2 =3D 0;
> > > +
> > > +     if (mac->multicast_filter_bins)
> > > +             mac->mcast_bits_log2 =3D ilog2(mac->multicast_filter_bi=
ns);
> >
> > The above seems to be common amongst the other two setup functions.
> > Maybe there should be a helper for this?
> >
> Ack. Will address this in v8.
> > > +
> > > +     mac->link.caps =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > > +                      MAC_1000FD | MAC_2500FD | MAC_5000FD |
> > > +                      MAC_10000FD | MAC_25000FD;
> > > +     mac->link.duplex =3D 0;
> > > +     mac->link.speed10 =3D XGMAC_CONFIG_SS_10_MII;
> > > +     mac->link.speed100 =3D XGMAC_CONFIG_SS_100_MII;
> > > +     mac->link.speed1000 =3D XGMAC_CONFIG_SS_1000_GMII;
> > > +     mac->link.speed2500 =3D XGMAC_CONFIG_SS_2500_GMII;
> > > +     mac->link.xgmii.speed2500 =3D XGMAC_CONFIG_SS_2500;
> > > +     mac->link.xgmii.speed5000 =3D XGMAC_CONFIG_SS_5000;
> > > +     mac->link.xgmii.speed10000 =3D XGMAC_CONFIG_SS_10000;
> > > +     mac->link.xgmii.speed25000 =3D XGMAC_CONFIG_SS_25000;
> > > +     mac->link.speed_mask =3D XGMAC_CONFIG_SS_MASK;
> >
> > Is there any point populating link.speed10 and link.speed100 ?
> > You're telling phylink that 10/100M speeds aren't supported in
> > link.caps, so these speeds won't ever be used.
> >
> Thanks, I missed this. Will remove 10/100M entries.
> > > +
> > > +     mac->mii.addr =3D XGMAC_MDIO_ADDR;
> > > +     mac->mii.data =3D XGMAC_MDIO_DATA;
> > > +     mac->mii.addr_mask =3D GENMASK(20, 16);
> > > +     mac->mii.reg_mask =3D GENMASK(15, 0);
> > > +     mac->mii.clk_csr_mask =3D GENMASK(21, 19);
> >
> > This will be the third instance of this particular mii data setup.
> > Please consider adding a function to do this setup.
> >
> I will move this code segment to common helper function.
> > Thanks.
> >
> > --
> > RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> > FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--0000000000003b0679064d2a0d8a
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
gccwLwYJKoZIhvcNAQkEMSIEIEmds8YruXz+kLzusi9PvUSj4X/xjlJST+Hyz+O6WN5QMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDMxNjIwMjc0NlowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAG1Ud31IjVSh
QFZsf6AaDp7pdhVd8kOhGr6bXM6EFiH5Qps9qB57B034/QB2FI5yq0Gp2/JGfIWbrw9c9EbZ67Rm
M4HOoEBQq+cDrQc5+lqMYDVnxmspJqeVC9lMH+MjbcIsONAHoRYoLum3bbQxnjHgHc7JX5PjSW6S
ufSXY8KBrEyDGVCz7/leqfmAnlNAW4e/Xayjcfcwsgt3UykT/bZUkg3SZjQzzczws9jixWlFOYqj
lvp0iRRkK/IB/abdrpKo11OZ7IgboALFQz/7NMlVzIIp5sgTmF77kQ43ujw7kxHjCdqdHakkI3o9
l5FvQ/i6WnfhUmz6yCP+vv5L2Bo=
--0000000000003b0679064d2a0d8a--

--===============3094140053938172811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3094140053938172811==--
