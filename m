Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI4CLFAx2GmqZggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 01:08:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA63D06E9
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 01:08:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E61A3C87ECC;
	Thu,  9 Apr 2026 23:07:59 +0000 (UTC)
Received: from mail-oo1-f99.google.com (mail-oo1-f99.google.com
 [209.85.161.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6288C87EC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2026 23:07:58 +0000 (UTC)
Received: by mail-oo1-f99.google.com with SMTP id
 006d021491bc7-673ee2a98b1so889884eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 16:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775776077; x=1776380877;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r54Ip/Oe4+zUV6uyDHDa456FeYDyYAWsV70HL3ovNYA=;
 b=IDT/e8NYpJGPQU8jo8wcg6E63yzcKMX5UwReVBQ+M0RbIcZcWHvBvJYxPNzed686F2
 QUr3A4vbVRgHlTAotJbYVEUHkO5o97tKykHenx/cUULbQXV8Glza78T0A2Z9fuYu/DiZ
 GIHMhg67ygmHvS2ErESgziD4dJt3/wFLRh4+Ixil6u5mjNM+KEr8F01QzwsBSZJJUcfK
 s3dVK3IZu0w+PA/LIOQw4AjGRkwDVfoLCYuNu+k6WvGufD/TB6lT/HGkcdt1UB9XTrxz
 9EEa/VV1VP3Rb3ts+REig1peYl66s1HKeBSYblUlziKpoLBdh4KMsf1nw6ECDaZb2p8s
 RPiA==
X-Forwarded-Encrypted: i=2;
 AJvYcCVcGjW4ntPjhLG75rGFpBx37ewpd8eMoEet1t+28qL/JlcqR+jYoMF3a1RdOQwYSNKy2SHRlx8eCr4O+g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywh8rzExArA6IxBWJW0wlY0Nq8ad/lZtwa3Nmoc+iJuPs1nrraP
 H5Xd92TN1QH77cb1i9SwCbdkSWdKMQGbthR/ur7G5NGzd27qzPDAS2q17tg8KICGfgJYr9QOb4E
 BrpauW17dzdI+Qo553V0PzOgUknQzpKn7mMqxl3xnOQ1kcprg0KCYkSXTMZYYzeep/pfcieyH6s
 cZAScuSqZLBPKOQS8md1L4smr9GpK6gqRdH4Ewa2HS4Lmi52oNRH67zb5oEJ/ycW+QQjNroQEDG
 xNSd5KV1ztZ0eBRTrqGgUUh+0/+9AuP8TFZab7aSw==
X-Gm-Gg: AeBDiespwnVKoL1oi9fffvb29ygDogua7+/Ho6mYMc1SftMZhkhQnfkxLIr8q09IuSn
 qn6byB8P+9MyutRR76UuuzwrcDG+kscsOi0zHi5wwwr4N+TGUrMZP8u6e6QiH8QBvO0H64lSLym
 cfwQYnC8VvU6vJ5FwUfqrO8mL2pJF+Kw2Ir/kxKy1Jb45aEgefp/jv39XqxILSn5PUWm5Ia1tqM
 CTqd+9IVWCLRkS8qzAVCYCS+sAXtIQDSXjjoVmjV3/4XVWRySpRjwioPcJUeYVrPDmuV3t5SJYM
 Ms5SBy9RlIOgbQXStFUFQ7DS3oCk+6RLnlqR2Sd+OzYnlwFEbq5K3An8tuyF7vQtseQRivqf2Gr
 2FrydA1jZgaq87adYSFJ4Vkx9cKAYsZwtYPxnL0Xf0Dki5M3UyU6SVCh+h/wp4OTXYe2hp0I0YF
 CJ0H81ht7MZoZ8VDw8zgSpieFB8F2j6ZvIlXdR85uJSvvPM8rPHyY9i3hAJxjXn+w=
X-Received: by 2002:a05:6820:c08e:b0:67d:e7c3:3c65 with SMTP id
 006d021491bc7-68be8dcf17emr455008eaf.56.1775776077451; 
 Thu, 09 Apr 2026 16:07:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
 by smtp-relay.gmail.com with ESMTPS id
 586e51a60fabf-423ddb52608sm129932fac.12.2026.04.09.16.07.57
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Apr 2026 16:07:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-43d0c06c232so1457367f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 16:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775776076; cv=none;
 d=google.com; s=arc-20240605;
 b=W77g6ChqQvUDflpJNTS5wrUFLoL+RbhwrhJ/WQs5Jgo07VcWAH4QWvo7BW/mHREy6F
 V1NCSToDIZ90SZ0cRfj3C7jP/kRtasl8v1CR44ZCY7YMlWydAOuUMh7QIwUM3A5g/1je
 alwyR1M7uO8Eg9GYrw8TtDYNKBEuVIZIBZqeAsWsfseuZiPTMs5f2m5jk+dby0FAT+ak
 yx6Ls3lJJcGVjeSovOwYf/bdgjuPtd2aJYbEsCUwRc6iCJHmBVQtsik1OQxGLwPK2Ij6
 Vy86XXI3bi5d51Ai5udaleijzRWcI5f9MPJe9ORRKZzW1JPgTdRUUvx1VHoEWMGJNFaL
 0WJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=r54Ip/Oe4+zUV6uyDHDa456FeYDyYAWsV70HL3ovNYA=;
 fh=LfXAysd7zC+p2ravYWE2/VVKk42w4RMDVTjpLD1sw/c=;
 b=KXoTGtdFD9HsA7bbp6KkThqVivjUERTp4NtrbTE3tksXH9DwSzOeDkyrV3X2LqjYYI
 Xrlw9MGXsG3P6zqaUBIuzkIH3zqaZg/PjpSHq9u7y0uGDwCvDrDkva+e86vKIrReNuDJ
 sxyHTiQMrTin4DbW/RhU1MuZgkMUXHBHFL94uEVVSTRO/CSoexwwqjxaefCun1GLlJO7
 nwGakTKmE7xbJbncdz2H8XG93BEFb/wCTC6W13B+8pMw6CFg2FHlfpFZjZCmHmqanNSQ
 qQtS5Up99x2UdrU24Gs5ZwTKIo5UWVt0z2gsAWkI2EIgF7mVgA3i9uYovaPE4uNZY5oq
 h3oA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1775776076; x=1776380876;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r54Ip/Oe4+zUV6uyDHDa456FeYDyYAWsV70HL3ovNYA=;
 b=VhOBRV2gRPbVfRb+5xv2mq3eRxLGLinCyTp6///v/Muhs2IqlGNKPUUKBF/pPXOogC
 is73kwxJMHMVI8n/PwBUJZbbvN35y2QHGkBmIHEY5vut/Wpg5B8cF3JIbQ09D0Ei0I0u
 OECpB4XAphA/tyHme03YyJ3YkgvvuMfZxtqf8=
X-Forwarded-Encrypted: i=1;
 AJvYcCWmcukxZCkGjOUGIHWcQ7IyO8HXzHrscV5JfsqtHtrgJJaBKA9fvTXwyJjD8jZmilP6uqmBfbmsaBsDLw==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6000:2408:b0:43d:1c75:db70 with SMTP id
 ffacd0b85a97d-43d642537a8mr1160274f8f.15.1775776075746; 
 Thu, 09 Apr 2026 16:07:55 -0700 (PDT)
X-Received: by 2002:a05:6000:2408:b0:43d:1c75:db70 with SMTP id
 ffacd0b85a97d-43d642537a8mr1160236f8f.15.1775776075250; Thu, 09 Apr 2026
 16:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
 <E1wAPBR-0000000F7ju-1fD9@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1wAPBR-0000000F7ju-1fD9@rmk-PC.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Thu, 9 Apr 2026 16:07:42 -0700
X-Gm-Features: AQROBzCWB9VUvQ4RpL1EJYfajIJ7yfPJs9yk-WkOxw3bptp81Ttc8d621uiKtaQ
Message-ID: <CAMdnO-+TK65AxjTsDd017Mhop+VC3Xf8jtfaTXYpE6wBNZOt4g@mail.gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
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
Content-Type: multipart/mixed; boundary="===============6124308451309945004=="
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
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,armlinux.org.uk:email,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 43EA63D06E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============6124308451309945004==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000374f5e064f0f16e7"

--000000000000374f5e064f0f16e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Wed, Apr 8, 2026 at 2:27=E2=80=AFAM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> The Synopsys Databook and several implementation TRMs identify bits
> 15:8 of the version register in dwmac v3.xx and v4.xx as "userver".
> We even print its value with "User ID". Rather than using "dev_id",
> use "userver" instead.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/hwif.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/eth=
ernet/stmicro/stmmac/hwif.c
> index 3774af66db48..830ff816ab4f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -15,7 +15,7 @@
>
>  struct stmmac_version {
>         u8 snpsver;
> -       u8 dev_id;
> +       u8 userver;
>  };
From the XGMAC databook that I have access to bits(15:8) identify the
DEVID field of MAC_version register.
The userver field is from bits(23:16) of the same register. This is a
customer defined field (configured with coreConsultant).
Currently stmmac doesn't care about bits(23:16).

I think the confusion is coming from macro name in common.h
#define DWMAC_USERVER   GENMASK_U32(15, 8)
This should be named
#define DWMAC_DEVID   GENMASK_U32(15, 8)
Hope someone with access to another databook can confirm this.

>
>  static void stmmac_get_version(struct stmmac_priv *priv,
> @@ -26,7 +26,7 @@ static void stmmac_get_version(struct stmmac_priv *priv=
,
>         u32 version;
>
>         ver->snpsver =3D 0;
> -       ver->dev_id =3D 0;
> +       ver->userver =3D 0;
>
>         if (core_type =3D=3D DWMAC_CORE_MAC100)
>                 return;
> @@ -48,7 +48,7 @@ static void stmmac_get_version(struct stmmac_priv *priv=
,
>
>         ver->snpsver =3D FIELD_GET(DWMAC_SNPSVER, version);
>         if (core_type =3D=3D DWMAC_CORE_XGMAC)
> -               ver->dev_id =3D FIELD_GET(DWMAC_USERVER, version);
> +               ver->userver =3D FIELD_GET(DWMAC_USERVER, version);
>  }
>
>  static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
> @@ -111,7 +111,7 @@ int stmmac_reset(struct stmmac_priv *priv)
>  static const struct stmmac_hwif_entry {
>         enum dwmac_core_type core_type;
>         u32 min_snpsver;
> -       u32 dev_id;
> +       u32 userver;
>         const struct stmmac_regs_off regs;
>         const void *desc;
>         const void *dma;
> @@ -247,7 +247,7 @@ static const struct stmmac_hwif_entry {
>         }, {
>                 .core_type =3D DWMAC_CORE_XGMAC,
>                 .min_snpsver =3D DWXGMAC_CORE_2_10,
> -               .dev_id =3D DWXGMAC_ID,
> +               .userver =3D DWXGMAC_ID,
>                 .regs =3D {
>                         .ptp_off =3D PTP_XGMAC_OFFSET,
>                         .mmc_off =3D MMC_XGMAC_OFFSET,
> @@ -269,7 +269,7 @@ static const struct stmmac_hwif_entry {
>         }, {
>                 .core_type =3D DWMAC_CORE_XGMAC,
>                 .min_snpsver =3D DWXLGMAC_CORE_2_00,
> -               .dev_id =3D DWXLGMAC_ID,
> +               .userver =3D DWXLGMAC_ID,
>                 .regs =3D {
>                         .ptp_off =3D PTP_XGMAC_OFFSET,
>                         .mmc_off =3D MMC_XGMAC_OFFSET,
> @@ -291,7 +291,7 @@ static const struct stmmac_hwif_entry {
>  };
>
>  static const struct stmmac_hwif_entry *
> -stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 dev_id)
> +stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 userver)
>  {
>         const struct stmmac_hwif_entry *entry;
>         int i;
> @@ -305,7 +305,7 @@ stmmac_hwif_find(enum dwmac_core_type core_type, u8 s=
npsver, u8 dev_id)
>                 if (snpsver < entry->min_snpsver)
>                         continue;
>                 if (core_type =3D=3D DWMAC_CORE_XGMAC &&
> -                   dev_id !=3D entry->dev_id)
> +                   userver !=3D entry->userver)
>                         continue;
>
>                 return entry;
> @@ -358,7 +358,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
>         /* Fallback to generic HW */
>
>         /* Use synopsys_id var because some setups can override this */
> -       entry =3D stmmac_hwif_find(core_type, priv->synopsys_id, version.=
dev_id);
> +       entry =3D stmmac_hwif_find(core_type, priv->synopsys_id, version.=
userver);
>         if (!entry) {
>                 dev_err(priv->device,
>                         "Failed to find HW IF (id=3D0x%x, gmac=3D%d/%d)\n=
",
> --
> 2.47.3
>

--000000000000374f5e064f0f16e7
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
gccwLwYJKoZIhvcNAQkEMSIEIKWQy2mXIISkzcYEPlbdhtpPqkM/JUwZeydB13GuGHztMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDQwOTIzMDc1NlowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAEE2b2zWJhSn
m11bQ8aBW6C9td4QBvPDmIdoV6rE+Y9H5jn/1fXAaPSdu3AoC3/79TkDGBpd3bg84S/rA7I1MmU2
5eooWq3dKlgWLSwIsY8FT5Uuv5X03b8U5zCch+kX9I1LvJzPA4C1OWJYuJcM712tNQt8drk2I2Ye
HajTx4I1gih4m/44YEUukvny325l2cxanNzopdMx24RkDEwcFfgjEjvsHYHDIFDCATl8g1yhMiyH
1Qgq/8TDjrLVlXolQasoLRXfb8s+lEV55fQREW2D0zztsCabp5v8eBKmQPICfv1CTNa7t0haWdN0
9M2LRyQbKpPprmWCMW2UncOAjjw=
--000000000000374f5e064f0f16e7--

--===============6124308451309945004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6124308451309945004==--
