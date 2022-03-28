Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1151A4E960F
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 13:59:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF03FC5E2CC;
	Mon, 28 Mar 2022 11:59:42 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCC94C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 11:59:41 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id p15so28133232ejc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 04:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ze/m2vpSHnRCFApl36JFy8UvWyMkN8Q8xJDfS9/vOsQ=;
 b=NVOXoLAv+phJR/OXqllZcD5b1Fb56JYg3bpa9CyubfWoBO1WHvjfTDV45sk6lAT8Fy
 7t009RHWxiiHqBKnz/OeQuqQmXSCOcVYaXqLTiGiASfhycyiNyEFoUiPQZUsxarV74gK
 EhdNs8Ll/Sv/A7aqkcPJrL1WXaa/SyK4WORC78JxBpCteMPOv8tFjbmuBOhaI2hiioYQ
 zlTctUJcXcIcVntfbCHEOJXr8PjiDoUyFKlkig+4SFg2C13BlGNwT+QPFNe1swUJVUQi
 ECSzsfOHlRzKZo6tPYChgj4YND8eh2r+yggI6cBl6P8sqPujf7WDxjSttAM5bNwcqPqT
 xGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ze/m2vpSHnRCFApl36JFy8UvWyMkN8Q8xJDfS9/vOsQ=;
 b=PTKm53sZNIs60QE/PZoGcFIP8g1T3CZSU+2GhRXblI9q4Ocly8sYRIrzIcnvTXlPAo
 SiCCIr+ZlX5Y8+YwK3d2KJo9z+hnRTg4Ibu0CBDHu8jU0NWn/s2P26TAF8NLv1ofFP3f
 eO/skpYPRRj199+Eof9yL6g/tgRNqwq8aC/w20z7bcD/N6UxGrrRVwRHijnAdTt5E6md
 DffreqXwh4s8xxbd0oXG/CPb3AlMaSv9Ddu5tGht7xb/iA1XF167gpQRPKZhf6CPag+K
 fxXNaFC2Md7xvBs4f+2hJ+ejxdSeJbL9r84t2ilNRk4P0C2eW/LT7UPxad2jyIQ1ObNo
 zJpA==
X-Gm-Message-State: AOAM530iwJZrn4vl8h+5Ix7XY8JA+L3PX/ss93hpW67ninPYsbWFanN3
 cLDrBF8G4eGUnx04wqHqMXg=
X-Google-Smtp-Source: ABdhPJyPqxtkyOhDlzlQWoqBpr2/PWiXxO8oiWRGFKkhtuHhlxy5u1G+w790Mbqi41xojqATEHav1w==
X-Received: by 2002:a17:907:2162:b0:6df:ec76:af98 with SMTP id
 rl2-20020a170907216200b006dfec76af98mr17316920ejb.314.1648468781204; 
 Mon, 28 Mar 2022 04:59:41 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it.
 [93.42.69.170]) by smtp.gmail.com with ESMTPSA id
 j9-20020a170906534900b006df9b29eaf1sm5867876ejo.8.2022.03.28.04.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 04:59:40 -0700 (PDT)
Date: Mon, 28 Mar 2022 13:59:40 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <YkGjLPN7tjVeckEO@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
 <fef4e5dd-d843-ea37-7701-bcfac9d1c9b5@foss.st.com>
 <238c6d7b-a61c-d09e-9377-8f49dad40eeb@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <238c6d7b-a61c-d09e-9377-8f49dad40eeb@foss.st.com>
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
Subject: Re: [Linux-stm32] [RFC PATCH 1/1] ARM/arm64: categorize dts in arm
 dir and fix dependency in arm64
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

On Mon, Mar 28, 2022 at 11:20:00AM +0200, Patrice CHOTARD wrote:
> 
> 
> On 3/28/22 11:09, Patrice CHOTARD wrote:
> > Hi Ansuel
> > 
> > On 3/28/22 02:09, Ansuel Smith wrote:
> >> - Categorize every dts in arm directory in subdirectory
> >> - Fix Makefile to address for the arm subdirectory
> >> - Fix any arm64 dependency
> >>
> >> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > 
> >>  create mode 100644 arch/arm/boot/dts/st/Makefile
> >>  rename arch/arm/boot/dts/{ => st}/spear1310-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear1310.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear1340-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear1340.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear13xx.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear300-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear300.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear310-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear310.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear320-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear320-hmi.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear320.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear320s.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear3xx.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear600-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear600.dtsi (100%)
> > 
> > 
> > All SPEAr device tree should go into stm sub-directory, as this platform is a STMicroelectronics one
> > as STi or STM32.
> 
> Just got an internal discussion, all STMicroelectronics platform should go into "st" sub-directory, and not in "stm" as indicated in my previous e-mail. ;-)
> 
> Patrice
>

Noted will do the change. If you notice other wrong categorization, feel
free to write a big list so I can fix them. In short merge stm in the st
directory. (arch_sti and arch_stm32)
Aside from that they are all correct right?

> > 
> > Thanks
> > 
> > Patrice
> > 
> >>  create mode 100644 arch/arm/boot/dts/st_ericsson/Makefile
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ab8500.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ab8505.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-db8500.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-db8520.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-db9500.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-dbx5x0-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-dbx5x0.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-ab8500.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-family-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-stuib.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-tvk1281618-r2.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-tvk1281618-r3.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href520-tvk.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefprev60-stuib.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefprev60-tvk.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefprev60.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefv60plus-stuib.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefv60plus-tvk.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefv60plus.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-nhk15.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-s8815.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-stn8815.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-snowball.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-codina.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-gavini.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-golden.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-janice.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-kyle.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-skomer.dts (100%)
> >>  create mode 100644 arch/arm/boot/dts/stm/Makefile
> >>  create mode 120000 arch/arm/boot/dts/stm/armv7-m.dtsi
> >>  rename arch/arm/boot/dts/{ => stm}/st-pincfg.h (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407-b2120.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407-clock.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407-family.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410-b2120.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410-b2260.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410-clock.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih418-b2199.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih418-b2264.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih418-clock.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih418.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stihxxx-b2120.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32429i-eval.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32746g-eval.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f4-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f429-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f429-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f429.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f469-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f469-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f469.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f7-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f746-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f746-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f746.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f769-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f769-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h7-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h743.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h743i-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h743i-eval.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h750.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h750i-art-pi.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp13-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp131.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp133.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp135.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp135f-dk.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp13xc.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp13xf.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp151.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp153.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp153c-dhcom-drc02.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-avenger96.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-dhcor-avenger96.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-dk1.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1-ctouch2.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1-edimm2.2.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-iot-box.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-microgea-stm32mp1-microdev2.0.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-microgea-stm32mp1.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-stinger96.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-stinger96.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-dhcom-pdk2.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-dhcom-picoitx.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-dk2.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-ed1.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-emsbc-argon.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-emstamp-argon.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-ev1.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-lxa-mc1.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-odyssey-som.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-odyssey.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xc.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-drc02.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-pdk2.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-picoitx.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-som.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcor-avenger96.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcor-io1v8.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcor-som.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dkx.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-osd32.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxaa-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxab-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxac-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxad-pinctrl.dtsi (100%)

-- 
	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
