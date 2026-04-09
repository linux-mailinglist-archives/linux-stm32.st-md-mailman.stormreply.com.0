Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NVcIOAk2Gm9YggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 00:14:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622D3D02B5
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 00:14:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87237C87ECC;
	Thu,  9 Apr 2026 22:14:55 +0000 (UTC)
Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com
 [209.85.221.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95016C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2026 22:14:54 +0000 (UTC)
Received: by mail-vk1-f227.google.com with SMTP id
 71dfb90a1353d-56d357797acso978989e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 15:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775772893; x=1776377693;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aB0bwqNi4j6OGTv6J5eNtXtaQf3iDR/hAWd8xrlu2Qs=;
 b=MQ+bdgMN9FQQrHNK5fuiyj824KXERKSEqCYEidoTra2qucGTQHWooi2AglFxZ2ZrK8
 RCqgsJvsROeuVQmeUuOaI3Pb+H0rXSLbA8jJI5Ievhaow+jDIArUgf+iBVLWf1DWUXo9
 uFLKC+M1zyIucn+eOBk9W/V4YQ9qrnMqvoikT2BYwZGvANe6nImXvnePxNndnqeQ88JV
 x8NBJWr3xFuNvW1sFrk93YUmRqAB4inwjxL2mbs+7OueKaMXPQUMXe7FHfvVskzoHaIj
 qYYElKJt3YlGIWPcoipypozffXi/6RI02iiPxcA75xNMRAGaU02HnnzQyhjqolH8OarW
 ftqw==
X-Forwarded-Encrypted: i=2;
 AJvYcCWg4mkCK6ZlnlO2T5rU30mYoOpLzbl7qHlEYnU53qeReGRkK7ThczpRUgq4sYQ6XjNB6Ert20BCVZoXmQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw6s7bBpRPD8fJi2InNBslPbLhqusa+nbYvs6KawtxdzfGWnF0i
 q7b4WtQXMdURd7qN3wSpkxfsvmzgQbIWqWwiR1XbVcsIX6a8jJ7QTWn3GH2VahoRf2KLPo3Mpql
 rR+YGjOI7gsPi29+PSqD6oZhEjFI4JNCtZ8uVydAL3toc8B0J/bWOLlPokY8vneCjGZFFQYd7yy
 mMD4juslPJZcwrwKXKNXhetzUiZladb+bJ1zwUQ66KJ5+cpFTe2ufxvd90CDN+ibzQoCJNn/MyE
 i6j4vGx/Qcp3jGCwgQJBNBwhqtcLNoh5uKvDrwgGA==
X-Gm-Gg: AeBDiesHjEl+qUG9LlPuwaGAVHMeUmyEP+zcPKIFVctQnz9SwHF2ewvZ6N7/yHnYOpp
 UO+qma9CPnwIAfcnQnK3//MRGRSEQWz4E+oGy91k/eag5wGo8aAUAHidlGwRBBI+zqLY9BtL/oy
 51CKU24WKiiJ4FDrgsUTzfsUBDtzLZRTDuJsoKxgZmnhn15iHTKSZ/dNkxxNEZN6v/LfSamL73N
 hi/PM7Dy4No1Y0/4/BywoaS0+u6ZdSlL8H9CBLwfqtYaB7S7+CcL8+OJDoxlGeDOVxXGQ7TbxX6
 KV/g2YfldXux0ih4QhXjfaDHQfKaRoVOgvBRNTrIL1hodD3yxehzU1CSJgTEUGcP9Y+394Om/ld
 kYdnmL2/Mfe+pOZbtRdlJ14MZ1r1+F67A3v+HZai5AfHNybiB0j7izr/jFEjUZxQtbl/S+XbGwk
 E55pPXUyA7n6xyeZI47aV4gkeCI4TE0DGo1v1CjIhYV1Yv77AtXJ6wvkVd9s9atnE=
X-Received: by 2002:a05:6122:1689:b0:56b:9b7b:83e7 with SMTP id
 71dfb90a1353d-56f3bc53702mr485722e0c.7.1775772893191; 
 Thu, 09 Apr 2026 15:14:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-24.dlp.protect.broadcom.com. [144.49.247.24])
 by smtp-relay.gmail.com with ESMTPS id
 71dfb90a1353d-56f3b919d96sm63725e0c.3.2026.04.09.15.14.52
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Apr 2026 15:14:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-43cf5b4dac8so1382423f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Apr 2026 15:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775772892; cv=none;
 d=google.com; s=arc-20240605;
 b=YMEJvxhh2bzcRXL8MspiTsFqM9FKx6VPuMLoxoLdP/rH/InlUC66LDpHzBeUYRiKqF
 4N/oKRslP7DAhTA0B30zU6ikNneZEFeq03V0YBHkk295MJx5e8WXEDbv7MOv3pfsAP+0
 Z9IF5x2gV75i/Z/oXEFJGHZe4zy48msKk6XuuXawyIQ7C24pRs2l/syLqhDCzOkql/dU
 zNleNwdAPDb8LziSYN2RRPIvNS9JlqROrbj49aIDs7YYDC1X6YDW7lylVxZAQmNmtEjK
 i+obXkbVY26u5ArtyFFjg4B2lm/AKinW84urWMkeIAIzqCGxWDlv7kFMmHG46wbTfjN3
 wLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=aB0bwqNi4j6OGTv6J5eNtXtaQf3iDR/hAWd8xrlu2Qs=;
 fh=sLq90p9UIrJR4V2zLBUbmJltzM+PBiIT1xQZg+yIdEo=;
 b=b+eYSc/OMtOMAx/f+zAMO978YcgotrAEStsYgO9iHkjVeOMuXHTVXNZK3CTDlqLlX7
 582qW5iNEd3MjvrqjwIOuNWL5C4QGrepmMT6amZkdSlnZfWR5Ln8fh5lJujauaQynhn3
 e3x/wjPEIuoBooKtsHKQaVpVXzz/s0tDQno3npRLyZ5ubz94VHr1+kwfhFdNB1Bk9s5/
 /eXw+550n0H5+xkvDcDr0a3r28TmzjqZ/hkg7+5wXd0sVzzejdOkblhdkPelqXUd0Uol
 imOhdqSjevmsN+OX6pfvfk7+C2GXYboZYKFORa42pCuhB2xtfhUnxltQr7SQtrjhnLgw
 N7sA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1775772892; x=1776377692;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aB0bwqNi4j6OGTv6J5eNtXtaQf3iDR/hAWd8xrlu2Qs=;
 b=fu7nRk6NFcjHGE1u+TTEiPK30FqRxFqTU+5HKS0htfMh8rwmV3Jd65kNJCyyzbyI1o
 cL8puYTkeWVAdUu1JEFns2a/fPpww8UwSc3NUrtY/GNXwbeyStft+OTq58rz2zqhOexM
 W5dVdwc5txZ5V1f/75agdLl75bs8bonJG+kQ8=
X-Forwarded-Encrypted: i=1;
 AJvYcCXUbJUYzaQk4MHoL0CSbyx1x+Cl7IBlc38BaPV5cLOwAdrfVc9+O9vwYxs2TdzrsGI50kmic1XqEQSV9Q==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6000:2010:b0:43c:f7e5:817a with SMTP id
 ffacd0b85a97d-43d64292b01mr916396f8f.19.1775772891636; 
 Thu, 09 Apr 2026 15:14:51 -0700 (PDT)
X-Received: by 2002:a05:6000:2010:b0:43c:f7e5:817a with SMTP id
 ffacd0b85a97d-43d64292b01mr916355f8f.19.1775772891127; Thu, 09 Apr 2026
 15:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260402213629.1996133-2-jitendra.vegiraju@broadcom.com>
 <20260407020954.3674529-1-kuba@kernel.org>
In-Reply-To: <20260407020954.3674529-1-kuba@kernel.org>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Thu, 9 Apr 2026 15:14:37 -0700
X-Gm-Features: AQROBzDIrVBrq9a8N-kCZj3is_dHAtUZh7lT-03nRSlBMuTVHnIsC_ZMyZ5jrJ4
Message-ID: <CAMdnO-KHq273kkC2wBou7oEK1BAHbYYW4u9iRV9nfe0dNk_61A@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Cc: vladimir.oltean@nxp.com, chenchuangyu@xiaomi.com, edumazet@google.com,
 lizhi2@eswincomputing.com, yangtiezhu@loongson.cn,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 bcm-kernel-feedback-list@broadcom.com, quic_abchauha@quicinc.com,
 pabeni@redhat.com, hawk@kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 ast@kernel.org, rmk+kernel@armlinux.org.uk, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 horms@kernel.org, bpf@vger.kernel.org, davem@davemloft.net,
 ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net-next v9 1/4] net: stmmac: Add DW25GMAC
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
Content-Type: multipart/mixed; boundary="===============7249668613471231864=="
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
	RCPT_COUNT_TWELVE(0.00)[34];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:vladimir.oltean@nxp.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:quic_abchauha@quicinc.com,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:davem@davemloft.net,m:ovidiu.panait.rb@renesas.com,m:johnfastabend@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm3
 2@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nxp.com,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,broadcom.com,quicinc.com,redhat.com,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,mail.gmail.com:mid,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 2622D3D02B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============7249668613471231864==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006e63e4064f0e5851"

--0000000000006e63e4064f0e5851
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 7:09=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> Subject: net: stmmac: Add DW25GMAC support in stmmac core driver
>
> This commit introduces support for the DW25GMAC hardware in the stmmac
> core driver, which uses a new Hyper-DMA (HDMA) architecture. It adds a
> new DMA ops instance mapping virtual DMA channels to physical DMA
> channels and sets up the basic device configurations.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c b/drivers/n=
et/ethernet/stmicro/stmmac/dw25gmac.c
> > new file mode 100644
> > index 0000000000000..82eb22bff73e0
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
>
> [ ... ]
>
> > +static int rd_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel)
> > +{
> > +     u32 reg_val =3D 0;
> > +
> > +     reg_val |=3D FIELD_PREP(XXVGMAC_MODE_SELECT, mode);
> > +     reg_val |=3D FIELD_PREP(XXVGMAC_ADDR_OFFSET, channel);
> > +     reg_val |=3D XXVGMAC_CMD_TYPE | XXVGMAC_OB;
> > +     writel(reg_val, ioaddr + XXVGMAC_DMA_CH_IND_CONTROL);
> > +     return readl(ioaddr + XXVGMAC_DMA_CH_IND_DATA);
> > +}
>
> Does this readl() need to wait for the hardware to clear the XXVGMAC_OB
> (Operation Busy) bit? Returning immediately might read uninitialized or
> stale data if the hardware hasn't finished the fetch.
>
This is an issue. We will fix it.
> > +
> > +static void wr_dma_ch_ind(void __iomem *ioaddr, u8 mode, u32 channel, =
u32 val)
> > +{
> > +     u32 reg_val =3D 0;
> > +
> > +     writel(val, ioaddr + XXVGMAC_DMA_CH_IND_DATA);
> > +     reg_val |=3D FIELD_PREP(XXVGMAC_MODE_SELECT, mode);
> > +     reg_val |=3D FIELD_PREP(XXVGMAC_ADDR_OFFSET, channel);
> > +     reg_val |=3D XGMAC_OB;
>
> This isn't a bug, but should this use the XXVGMAC_OB macro instead of
> XGMAC_OB here for consistency?
>
> > +     writel(reg_val, ioaddr + XXVGMAC_DMA_CH_IND_CONTROL);
> > +}
>
> Similarly, does this function need to poll for the busy bit to clear afte=
r
> the writel()? If back-to-back operations occur, the next indirect write
> might overwrite the control and data registers while the hardware is stil=
l
> processing this request.
>
Agreed. This is bug, we will fix it.
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index f02b434bbd505..64c38de294da2 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
>
> [ ... ]
>
> > -int dwxgmac2_setup(struct stmmac_priv *priv)
> > +static void dwxgmac2_common_setup(struct stmmac_priv *priv, char *mac_=
name)
> >  {
>
> This isn't a bug, but should mac_name be declared as const char * since i=
t
> is passed string literals like "XGMAC2" and "DW25GMAC"? This avoids
> discarded-qualifiers compiler warnings.
>
> >       struct mac_device_info *mac =3D priv->hw;
> >
> > -     dev_info(priv->device, "\tXGMAC2\n");
> > +     dev_info(priv->device, "\t%s\n", mac_name);
>
Ack
> [ ... ]
> --
> pw-bot: cr

--0000000000006e63e4064f0e5851
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
gccwLwYJKoZIhvcNAQkEMSIEIGwoVXYTb7jIt4pZrqv7oj7W19W19KkcepsmKqv6JpsJMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDQwOTIyMTQ1MlowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAAZLX4DO4Cov
kQIFrRc07yuLHnUiFw6Zy57h25q9VBipyCFcX1t+qvtoZWuRRC34DLZB5+TL5jSkWkcypzrGbJL1
a9ywfeNdACY6ZTGC1dzVICDIM4gdYlCBwXyly5bwm+/+rf+yKQS2wRFhZ0sWOrVpsTcglCi3F/UT
plCuAp8w71I5vtcxJiWUmU5+BXXMQFdLdoSPO4hFp7aOW8hO87mQ0LIzTwtt3sn5Vu9mFCmbWw3b
swspQ85xb5Ra9j5Do1TcVaB4HHXojqjB1a4dxXEhLjIxfb+NJHxYAE9e3RZHwwrJFmVXW/JduMra
502KfFM/YwnlfaghhO75Mp8TqQ8=
--0000000000006e63e4064f0e5851--

--===============7249668613471231864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7249668613471231864==--
