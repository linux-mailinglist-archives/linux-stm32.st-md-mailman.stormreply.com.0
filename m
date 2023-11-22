Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 116287F4EB5
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Nov 2023 18:51:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD696C6B479;
	Wed, 22 Nov 2023 17:51:10 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5A5BC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Nov 2023 17:51:09 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5cd0af4a7d3so295337b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Nov 2023 09:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700675469; x=1701280269;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TxnpKs2F+HZNYkXf/Y5BgrPY0hki8e46Z6NdLZXo0Do=;
 b=jMwR+fkjOg0COREt5ySix6e0WEM/X6bHETG59pKb7DhFOCcLQwOsKc+C2tLQa81rU/
 bBYaJPCYgxcAagb8FgbPkP5pWHT2snccNdXNIgh2fVKIAnCOobipZPVDfj60icgcWRLz
 B0+agM7VVdtGK4c/0AYvGoaDL45SpYm3oaAVhtPTYNRgevbV0Sb2/zbQ7tgwjwzT9nEY
 KBS4jfOtzAChlqZR3tqUZITLD8505WjaZATwePYly3L/7JTpsiq076PEU0pupRC65isE
 AQy6J/n9Xlg+Qby4iTvgELdDtgTcvgZJYiKv1N1m+zssOdnbyX6yEgZncOmAujZ8T2r7
 tWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700675469; x=1701280269;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TxnpKs2F+HZNYkXf/Y5BgrPY0hki8e46Z6NdLZXo0Do=;
 b=hUjvrwEsHATPeLhq71KvU8W2BlclpxB4tGss7S/e0j4bW5OURDDzleH9Kk2GrgKPht
 gKyzJAbGWfMjOGAATNrrJKpCTyWifTUkR8nj/Bu/WSCi4JksY7t959/PwHuhADUb2ifh
 wa9B/7PtIou6fTVAl1EZ2G5TuH2jnxSNo7Q1taQGg3tSxzAysCCBgDbOIHmxyGCsefH8
 FSRT2QCdeUdw6s9uZOmrdAyfxxmzd7vuFjitHloDWn62qjIs8Yo2NyzqKOL9faLuNOg/
 jRQX48+XG6kK5cI6XrPPiMVqpCKBBxsKAAzU0x1oTR1NCTPKk1BDF1k0ZuTW0LGS3z/E
 RT2Q==
X-Gm-Message-State: AOJu0YxsVI9RvrAjwolP3CVfGpbHbvQSarJLb8G3VTpKL01RnxooMLDk
 12MEql8DLTqgRn5hANkFO06GrxrqiqaswHekXT0=
X-Google-Smtp-Source: AGHT+IFVH/BFWt02BJRt89HCYBEkZm6l8N7OMZmIj2n4mUUQxZeU4z4Xe9RaA6X/2NVtoKOkfpeHPoOXYUDC9+dm0Xc=
X-Received: by 2002:a81:9404:0:b0:58c:b8b4:2785 with SMTP id
 l4-20020a819404000000b0058cb8b42785mr3671430ywg.45.1700675468737; Wed, 22 Nov
 2023 09:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
In-Reply-To: <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 22 Nov 2023 19:50:57 +0200
Message-ID: <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjaminfair@google.com, davem@davemloft.net, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 tali.perry1@gmail.com, mcoquelin.stm32@gmail.com, edumazet@google.com,
 joabreu@synopsys.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, j.neuschaefer@gmx.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 2/2] net: stmmac: Add NPCM support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Andrew,

Thanks for your comments

On Tue, 21 Nov 2023 at 18:42, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
> > +                      struct plat_stmmacenet_data *plat_dat)
> > +{
> > +     u16 val;
> > +
> > +     iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
> > +     val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > +     val |= PCS_RST;
> > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > +
> > +     while (val & PCS_RST)
> > +             val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
> > +
> > +     val &= ~(PCS_AN_ENABLE);
> > +     iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
> > +}
>
> Is this a licensed PCS implementation? Or home grown? If its been
> licensed from somebody, it maybe should live in driver/net/pcs, so
> others can reuse it when they license the same core.
we are using DWC PCS, I don't see support for DWC PCS and I am not
sure it is supposed to be supported at /drivers/net/pcs
I do see a patch set to support DWC PCS but I don't think it answers my needs
https://patchwork.ozlabs.org/project/netdev/patch/1559674736-2190-3-git-send-email-weifeng.voon@intel.com/
>
>        Andrew

Thanks,

Tomer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
