Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAN3K51kuGlOdQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 21:14:21 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4348D2A0183
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 21:14:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3264C87ED8;
	Mon, 16 Mar 2026 20:14:20 +0000 (UTC)
Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com
 [209.85.210.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0102BC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 20:14:18 +0000 (UTC)
Received: by mail-ot1-f99.google.com with SMTP id
 46e09a7af769-7d1872504cbso104719a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 13:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773692057; x=1774296857;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MhXVPDTnTidPcTzF4JrbUMSdpo9xrLGq2gOncnz6UOI=;
 b=JxwAdJlLotjVKlpagGbsf119B5aSBqdZtZVChFiaFLbbt0wGjSRWCyJEg00zYFGDrK
 hda1c2bvmF4+CgVgHWuBhGiAFz7cbv3t1qtHY9kHfZP2yWTcZVoTXb6LTuRrupvdQHG4
 vCYzC+AvdL/3mtWVVpty9QPkaUIJzix8rU1e5jvioA0UoaAdrJ/g2H/atgZiFZddfUvS
 56tDhZbjxLiHpXHuVAObo8S4nYID4a/jd5hqcrDtGHnfhKPrOGd5mJqUlES7zBHYOpvF
 WptGb5ZrX2w74GGqSn2SeZfnY83buAe80Lex/rg6bhvpGWwgsHaq4stzf9uxpjd9w1Dx
 /V8A==
X-Forwarded-Encrypted: i=2;
 AJvYcCXOHBNox1qDeZCu7gRWgruj4hH3qbUCKlw9I9DZUdpJZA9BuoGyAB9iGo+UsNT+HqoES6nOFIjTg7D3Rg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwesirL/a9iHqCYIhOQ0WiwQHR8AFyLQfskBXiEkKAJWSOB2ETq
 nSEQJxhGaZy7KFNMKxHINQsEyfW7F00FM3D0eyB6e9sHWCOJFFrl+DnOQzgywkGWTdJWeArax0u
 4Wt25qoRTnnZJXAw/iusEsLbmfa3L6emUkgPLcBrdFtUyONa+bzNkCmeQS+fkhlcSIREV7WXaCL
 njTAD0BJYHf4ioE0RIkzM3Xr/pAsVs8bPgphBWsNG1CEN15Dwe0ikrraqAUt1g05fQRTZDisRzD
 5SdKQdKB2ftR8PQ/mtv47RV8Jk/yXp6sI7UtSNgWQ==
X-Gm-Gg: ATEYQzx5VXf8CWt3BdU3FEM7Kz7xzeNUuPQuGxqpD1Ra53LoeYueXkMoVntm86BfFCM
 QgYwpFJ+rdMhf86QEMYjiPD9JxzHXf38rs1voU7pKXFeIDF5ozHv1aWdh/lkelroRrlWm1HRXir
 Iyux7OAHJcE3axehihEZjWBlwgSv9WKXis41QeMApLgcedE4csgBG6hcuVdYkzzcjD5PwwSYTix
 R+r6kPoRPD4I4fvOC9v/GSGD1YYBSb5Y/h1oRlei60f1YJc2XjKsSiQFH3obRTCZNCAVFwBi1Ml
 v27zgcmSaqcAHDzIVLVReW2RsBMBhPoXiN/MrNxYfjCGdbPlZU7y4inJXuBoRAftRbVRARaUBOi
 X8Z6LYNYP5G74SOmvbvwybHUJdGotBm3dcJVLN4EJKBwtYt3bzimyFTcGmFb5YmV/JHPD7KdEYm
 j1YwY+rHmy141wgisMna+quQDUZfFKoHiFVZJz3j0CwyNNRJ+b5NfsBhW+v/FLqbsO3w==
X-Received: by 2002:a05:6820:608:b0:67b:a4cb:293f with SMTP id
 006d021491bc7-67c049725f3mr455733eaf.17.1773692057425; 
 Mon, 16 Mar 2026 13:14:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
 by smtp-relay.gmail.com with ESMTPS id
 586e51a60fabf-4177e5f3249sm2583254fac.12.2026.03.16.13.14.16
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Mar 2026 13:14:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4362197d1easo5049352f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 13:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773692055; cv=none;
 d=google.com; s=arc-20240605;
 b=I28LWm6HFf+TMt1JufYS4+OZboBrHj0SSsQY6AXmfgjz4dCl+j0caQOoYQfxidUZiA
 o+kViit9t1wUS8scSISGYukwY4dolz8rKGrJrRO5xdDrK/7/APkEP9csllAwSFqUPYY5
 XwiSHLKFrXiSW6Df01jKZqBFXFaONBuRbCOWDN4YuScsTRpk5uEdJlD7j7G515idiwxr
 +Qd/Ycauc/4K1B2PvrS64PA7T6Fwzi8ghZatBo73CCE8r/x6MOnnkXv6ohcnWE2abOG1
 iE/LriXNr8mokgA2pKgjCyZUSf4UrSZ82xyzaav3goJmtceUSrKHcgVb2aEgidftGoPO
 IBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MhXVPDTnTidPcTzF4JrbUMSdpo9xrLGq2gOncnz6UOI=;
 fh=8n65H2iZ4nL8xVCkRXF8Y3Jw/g8GE2OPEie8nM+NWBo=;
 b=jUgfvPolqTddhku7zdMahjVmPNbBs92VeyLgWgV772L+2OjiBoQ2+zwxXJ1jG3mLyN
 YAwdollmxBr1m5uCfW+SOh60Eg1nEUp+ixRiG8mx+p1aQRYu01AGctZx4hGu7S29GIbP
 86cZmZp4DlvIFXHqCr84tbz6sxx3hbwD3AzrP+wSNvlS5QW+kY4J2QQzrHtRz+IKMAYl
 o0CM8hxyA/dIFuytQ4VxTvRzL6k910NQt0nUmQRxc6Df2VNSmAjam/pgFtyLiBYKVavI
 eB8Ue1V7j209v0mhJz7l8hRLKbYgkcnxboemIPE3k8CYwu9QvIz2+MVBADbR/EDgbZDb
 UNmw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1773692055; x=1774296855;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MhXVPDTnTidPcTzF4JrbUMSdpo9xrLGq2gOncnz6UOI=;
 b=BJA1R8iVq35S4iIaV8os2ASPJGeymq8iflmJE1ZfbI2OptiEILM6vwBoQXRfAxtA39
 Tn+lJj+CPuNGJ5U4mVVtTZME35FhFmT+LNv9TjRkQ13TIAZ5M9PeJVJ7YQgef5kCkd9Y
 eaUg5nCFTEEBKRuaG9tg/Ox4rZbyzNb4FOPJU=
X-Forwarded-Encrypted: i=1;
 AJvYcCXgqOcXhJyKUsxj9bqGDxbuFMXCZpf0jkp3Wkf09+i5MYsQclF/rOmmEpxzZVuEW5TbZ2xVz8jlfylekA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6000:1849:b0:439:beb9:5a96 with SMTP id
 ffacd0b85a97d-43a04db6013mr24504401f8f.31.1773692055530; 
 Mon, 16 Mar 2026 13:14:15 -0700 (PDT)
X-Received: by 2002:a05:6000:1849:b0:439:beb9:5a96 with SMTP id
 ffacd0b85a97d-43a04db6013mr24504362f8f.31.1773692054993; Mon, 16 Mar 2026
 13:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
 <20260313222206.778760-3-jitendra.vegiraju@broadcom.com>
 <abSaKe3d4fcBMqLm@shell.armlinux.org.uk>
In-Reply-To: <abSaKe3d4fcBMqLm@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Mon, 16 Mar 2026 13:14:02 -0700
X-Gm-Features: AaiRm51rhr8AUuKjJ896JXx8rkZIE9TCvoAwPiDICMMkm27V0tquX6eEi5cGDi4
Message-ID: <CAMdnO-+UEb8sVf8=Aj7G6UgY-DxWe3bFYbSbKJRdU4woEX+dWQ@mail.gmail.com>
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
 matthew.gerlach@altera.com, davem@davemloft.net, ovidiu.panait.rb@renesas.com
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
Content-Type: multipart/mixed; boundary="===============4605253503274646841=="
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
	RCPT_COUNT_TWELVE(0.00)[36];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:quic_abchauha@quicinc.com,m:me@ziyao.cc,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:vladimir.oltean@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:matthew.gerlach@altera.com,m:davem@davemloft.net,m:ovidiu.panait.rb@renesas.com,m:johnfastabend@gmail.com
 ,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[broadcom.com:-];
	HAS_ATTACHMENT(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[quicinc.com,ziyao.cc,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,broadcom.com,nxp.com,redhat.com,altera.com,bp.renesas.com,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	NEURAL_HAM(-0.00)[-0.228];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 4348D2A0183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============4605253503274646841==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000f01ba3064d29dcc8"

--000000000000f01ba3064d29dcc8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,
Thank you for reviewing the patches.


On Fri, Mar 13, 2026 at 4:14=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Fri, Mar 13, 2026 at 03:22:03PM -0700, \Jitendra Vegiraju wrote:
> > @@ -42,13 +42,18 @@
> >  #define DWXGMAC_CORE_2_20    0x22
> >  #define DWXLGMAC_CORE_2_00   0x20
> >
> > +#define DW25GMAC_CORE_3_20   0x32
> > +#define DW25GMAC_CORE_4_00   0x40
> > +
>
> Do these live in the same versioning numberspace as DWXGMAC and
> DWXLGMAC?
>
> > +int dw25gmac_setup(struct stmmac_priv *priv)
> > +{
> > +     struct mac_device_info *mac =3D priv->hw;
> > +
> > +     dev_info(priv->device, "\tDW25GMAC\n");
> > +
> > +     priv->dev->priv_flags |=3D IFF_UNICAST_FLT;
> > +     mac->pcsr =3D priv->ioaddr;
> > +     mac->multicast_filter_bins =3D priv->plat->multicast_filter_bins;
> > +     mac->unicast_filter_entries =3D priv->plat->unicast_filter_entrie=
s;
> > +     mac->mcast_bits_log2 =3D 0;
> > +
> > +     if (mac->multicast_filter_bins)
> > +             mac->mcast_bits_log2 =3D ilog2(mac->multicast_filter_bins=
);
>
> The above seems to be common amongst the other two setup functions.
> Maybe there should be a helper for this?
>
Ack. Will address this in v8.
> > +
> > +     mac->link.caps =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +                      MAC_1000FD | MAC_2500FD | MAC_5000FD |
> > +                      MAC_10000FD | MAC_25000FD;
> > +     mac->link.duplex =3D 0;
> > +     mac->link.speed10 =3D XGMAC_CONFIG_SS_10_MII;
> > +     mac->link.speed100 =3D XGMAC_CONFIG_SS_100_MII;
> > +     mac->link.speed1000 =3D XGMAC_CONFIG_SS_1000_GMII;
> > +     mac->link.speed2500 =3D XGMAC_CONFIG_SS_2500_GMII;
> > +     mac->link.xgmii.speed2500 =3D XGMAC_CONFIG_SS_2500;
> > +     mac->link.xgmii.speed5000 =3D XGMAC_CONFIG_SS_5000;
> > +     mac->link.xgmii.speed10000 =3D XGMAC_CONFIG_SS_10000;
> > +     mac->link.xgmii.speed25000 =3D XGMAC_CONFIG_SS_25000;
> > +     mac->link.speed_mask =3D XGMAC_CONFIG_SS_MASK;
>
> Is there any point populating link.speed10 and link.speed100 ?
> You're telling phylink that 10/100M speeds aren't supported in
> link.caps, so these speeds won't ever be used.
>
Thanks, I missed this. Will remove 10/100M entries.
> > +
> > +     mac->mii.addr =3D XGMAC_MDIO_ADDR;
> > +     mac->mii.data =3D XGMAC_MDIO_DATA;
> > +     mac->mii.addr_mask =3D GENMASK(20, 16);
> > +     mac->mii.reg_mask =3D GENMASK(15, 0);
> > +     mac->mii.clk_csr_mask =3D GENMASK(21, 19);
>
> This will be the third instance of this particular mii data setup.
> Please consider adding a function to do this setup.
>
I will move this code segment to common helper function.
> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--000000000000f01ba3064d29dcc8
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
gccwLwYJKoZIhvcNAQkEMSIEINUVUbysjL9+gNiqoYke75wxwIG38bARO/RSYDlx0FPlMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDMxNjIwMTQxNVowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAJvC306FDFxC
YyuqhwG9kk4ZE2u8CfOZbr12Sk/AAb5hZtzCfbOsLufo0ZNcY4TWW9REt6+7uiiyxAHKgN9hchsK
k0bLdOuuTkbOInqAxku1J//a0k7EXnUqwpMJPLSsTRs56Czw/fw0PQuuw5JFVc4C/8dk/i7fMiC4
D3DwfGGM4pM40xg8LC5ACVZcmEKCovxmlcPEzx2drZIBCOznEF2j/CaSyb/ym3+uBpejbUMyqgBl
9mEMRE7lrcnKmvIiFmGLiXsx2B1dXeOdg/hjYxXJ0O4XAQGhLZDFKUxlsRqV7TIWsJZWYNp1QF1R
u0jyC1v6qRrjB6uG0y/7HMIG4yo=
--000000000000f01ba3064d29dcc8--

--===============4605253503274646841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4605253503274646841==--
