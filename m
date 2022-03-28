Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F6F4E9814
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 15:27:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13313C5E2CC;
	Mon, 28 Mar 2022 13:27:17 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79317C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 13:27:15 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id b24so16890425edu.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 06:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PJXGZlpigjTh6H9JMMa18nQ2vBOjy1Eubx2lpLSUCN4=;
 b=P+Xah39W4u3PaDSAqPLufO5/H/K2gU2w/d2wFaGX2dVMn3ptW0NhEHGwzIdwRpRl/0
 z1FSOdPVtx96dA5F7FeFqr/xM+E7aaBMX+Jrr4ATSqkcDJ6ByLiqoci0ikB8zblEPzRr
 AgfVgEhpKJPDuyJpnsbMs0owuaCWieQCxknWTP5AisVim3x2oWgpvZspTe1rCjJ71yEY
 k1XEvY3EOHeoQH9GnIpyLgDu0KacloeGCU6qlaS6y84XNz0XNDoFZ24ZhfgNJ0IJhypy
 Itw+T2ZDe09wzSYH9OizIncV+P60OAXYspmhj2dwWHF5nT/b4EcIUOf1ZGBuS6ErOxv8
 XOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PJXGZlpigjTh6H9JMMa18nQ2vBOjy1Eubx2lpLSUCN4=;
 b=g9M65GLHBQxT83nRut5+SQOrka3ZOM7/ymWqJa9KSbFQY9r4fsNnJEAMVDXuoi8Zm2
 iZq0+ne25Yqtsz7mDaE81QDQd1YhER1fEDBJA90dkdiIE7Yo7Tgu2c2yr7Hh6JEyDkFm
 ks5efnlC/KFeyfG/bxYUba8GrsaZ8V/Oq1cEfpqKiLua4bLUNb9+hZ+Nb7MTwEYSGrkd
 sc5A9lQdOFf8jiGRxj4rZCtZRy8mRQiPR6Zl+4zzJCRArpAPfGXaQQbmNKT8H3tmn/kv
 I3NVwIG/hCRJOYolO+v+CPt0lJCKnYT5nodfmhrLRJoJ26EQgH/8r8f7BcxT7KdwwsIu
 DO+g==
X-Gm-Message-State: AOAM532O1EOdQZcvfg0Byqw0vP0KsteYQAmrNeQT7kFlqZyiKAV4DrBg
 29FmtPb2JfWR5gn0pL8tmpk=
X-Google-Smtp-Source: ABdhPJzfZMouNxSUPChSrobO0DmZY1dpjyjoJXynXzykI+ox1dAeHmzyb365QAjutoruA3M7o01bCQ==
X-Received: by 2002:a05:6402:27d0:b0:419:5184:58ae with SMTP id
 c16-20020a05640227d000b00419518458aemr16315076ede.314.1648474034597; 
 Mon, 28 Mar 2022 06:27:14 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it.
 [93.42.69.170]) by smtp.gmail.com with ESMTPSA id
 y16-20020aa7d510000000b004197c1cec7dsm6986648edq.6.2022.03.28.06.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 06:27:14 -0700 (PDT)
Date: Mon, 28 Mar 2022 15:27:13 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Message-ID: <YkG3sQ3MDhVoW8l4@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YkG2RPrtPaBNXb7a@latitude>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

On Mon, Mar 28, 2022 at 03:21:08PM +0200, Jonathan Neusch=E4fer wrote:
> On Mon, Mar 28, 2022 at 02:09:14AM +0200, Ansuel Smith wrote:
> > Hi,
> > as the title say, the intention of this ""series"" is to finally catego=
rize
> > the ARM dts directory in subdirectory for each oem.
> [...]
> > [1] https://gist.github.com/Ansuel/47c49925ee7ef4b1dd035afc74679ab5
> > [2] https://gist.github.com/Ansuel/19f61f1e583c49407ce35c10e770fbe0
> =

> Nice idea, thank you!
> =

> A few notes on categorization below.
> =

> =

> >  create mode 100644 arch/arm/boot/dts/broadcom/Makefile
> >  rename arch/arm/boot/dts/{ =3D> broadcom}/bcm-cygnus-clock.dtsi (100%)
> =

> Or maybe bcm instead of broadcom. Not sure which is preferred by
> Broadcom people.
> =


In arm64 they used broadcom so i assume the full name looks correct.

> >  create mode 100644 arch/arm/boot/dts/dove/Makefile
> >  rename arch/arm/boot/dts/{ =3D> dove}/dove-cm-a510.dtsi (100%)
> =

> Arguably part of Marvell.
> =

> >  create mode 100644 arch/arm/boot/dts/edac/Makefile
> >  rename arch/arm/boot/dts/{ =3D> edac}/ecx-2000.dts (100%)
> >  rename arch/arm/boot/dts/{ =3D> edac}/ecx-common.dtsi (100%)
> >  rename arch/arm/boot/dts/{ =3D> edac}/highbank.dts (100%)
> =

> Why edac?
> The most obvious name I can see here is calxeda.
> =

> >  create mode 100644 arch/arm/boot/dts/freescale/Makefile
> =

> Freescale has been part of NXP for a while, so it might make sense to
> merge the freescale and nxp directories. I can't speak for
> NXP-the-company, so that's just my view as a bystander.
> =

> >  create mode 100644 arch/arm/boot/dts/kirkwood/Makefile
> =

> The Kirkwood family should probably be sorted into Marvell.
> =

> >  create mode 100644 arch/arm/boot/dts/layerscape/Makefile
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a-moxa-uc-8410a.dts =
(100%)
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a-qds.dts (100%)
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a-tsn.dts (100%)
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a-twr.dts (100%)
> >  rename arch/arm/boot/dts/{ =3D> layerscape}/ls1021a.dtsi (100%)
> =

> The Layerscape family is part of Freescale/NXP.
> =

> >  create mode 120000 arch/arm/boot/dts/nxp/armv7-m.dtsi
> =

> armv7-m.dtsi is a bit confusing, because it contains a few devices at
> fixed addresses, so it looks vendor-specific at a first glance into the
> file. However, if it is actually as vendor-neutral as the name implies,
> I think it should live dts/ directly, rather than in vendor
> subdirectories.
>

Considering it's really just 3 binding IMHO it should be just dropped
and merged in other dtsi... But lets not extend this too much.
This is really just a simplic link and armv7-m.dtsi is placed in dts/
I create links in each oem that includes it to skip any changes to the
dts.

> >  rename arch/arm/boot/dts/{ =3D> nxp}/lpc18xx.dtsi (100%)
> =

> Here we have the NXP LPCxxxx family, which is AFAIK unrelated to the
> i.MX family (and thus the bulk of the Freescale legacy).
> =

> >  create mode 100644 arch/arm/boot/dts/vybrid/Makefile
> =

> Vybrid is another chip family of NXP, with a good deal of Freescale
> legacy in it as evidenced by the "fsl," prefix in the devicetrees.
> =

> =

> =

> Thanks,
> Jonathan

Thx for the hint hope to get more comments about the dubious
categorization about nxp and freescale.

-- =

	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
