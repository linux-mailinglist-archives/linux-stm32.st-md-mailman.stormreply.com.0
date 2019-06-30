Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C03DB5AE0B
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jun 2019 06:03:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB642C5E2D8
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jun 2019 04:03:28 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3B5BC5E2D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jun 2019 04:03:27 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j2so4884790pfe.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jun 2019 21:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FottbFd+Y+82l+HM3Qswb2Sq8WrNqq+eO0NHXgs+EzI=;
 b=Jbxz7MfdMmZ9o9WU6TyUqf6ZrfL8RUrvfvoPxbBG22L3Tk4Wp4DfYo+d5qshIfFkE9
 fgBRyvXj3dz2nThbe4d4j5HkIqi5yJKZqqq58a5QkEIa5ucRT5F3Q/RESOgmYITY8I40
 5336Xb0h7bFTtr/NhQA5vU2YWSvUZFBZP7s9FlQUeRlqCPcqmQkagTr3JIx2v6PUz3Y5
 QG74FO1lM5nd/FfBjZJDEvn4mXH25GFuLaBuXo2Rh3w8Oz3yUqYF0Mtmrr/RjPdRbs+l
 DyWY2Oz1E+/p+cFcFnewixFBpL9QEfwc4srdp17MhLaVfLGmWp+vtSHJpldVrahD+6Zf
 3Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FottbFd+Y+82l+HM3Qswb2Sq8WrNqq+eO0NHXgs+EzI=;
 b=V/WE4gH7ngYWNYS220gF5XuKQJjODpGH+aBARRqJv3SRYXrPfDh4Xoal4mEvsNkuva
 lZfh0OgOBYwkNRm/wXjG1MHiH01437+FE+aT4cBV4Tbz541oZuGgcnG12tunSa9ijM0J
 RMOlmDAGfzsyijcZNSPrBhKnzc2A2evJl+UPnsz0A49faY1965PjEbjOxX8MZyb7B312
 xlHkOSR81BUdpE7zNwqCKIWq9LE8vUX2BQp/eSWtYcj+htNsVRVUHQ3YImYK4a3cMOVI
 WVOdnD5w0T1GYhbWRhKrbGbjNmyjuNrUGrp2LCyOEIDK34spcqkvmhb/I40L4qpHKBfW
 JSTQ==
X-Gm-Message-State: APjAAAVAFo1svkqJYYRHrLedeyPdDsSnWHrEmcy7Sg6QzJvsCWCb+t3x
 bZmdGN0heoXoo02PTDaSR9cbIg==
X-Google-Smtp-Source: APXvYqxVT5FLTspCDUieP0WCVk9yzwrr53RtQxt9iPVStpUeXliigG7L7l0TCjnf4tDvnu5Xv5KGMw==
X-Received: by 2002:a63:f146:: with SMTP id o6mr17077968pgk.179.1561867405996; 
 Sat, 29 Jun 2019 21:03:25 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id j15sm6860777pfr.146.2019.06.29.21.03.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Jun 2019 21:03:25 -0700 (PDT)
Date: Sat, 29 Jun 2019 21:03:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20190630040322.GH23094@builder>
References: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/8] stm32 m4 remoteproc on STM32MP157c
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

On Tue 14 May 01:26 PDT 2019, Fabien Dessenne wrote:

> STMicrolectronics STM32MP157 MPU are based on a Dual Arm Cortex-A7 core and a
> Cortex-M4.
> This patchset adds the support of the stm32_rproc driver allowing to control
> the M4 remote processor.
> 

Applied patches 1 through 3, with a few fixes of compile warnings on
data types in dev_dbg, in patch 3.

Thanks,
Bjorn

> Changes since v3:
> -Replaced "st,auto_boot" with "st,auto-boot"
> -Update m4 reg values and align with unit-address
> 
> Changes since v2:
> - Clarified "reg" description
> - Change m4 unit adress to 38000000
> - Renamed "auto_boot" in "st,auto-boot"
> 
> Changes since v1:
> - Gave details about the memory mapping (in bindings).
> - Used 'dma-ranges' instead of 'ranges'.
> - Updated the 'compatible' property.
> - Remove the 'recovery', 'reset-names' and 'interrupt-names' properties.
> - Clarified why / when mailboxes are optional.
> 
> Fabien Dessenne (8):
>   dt-bindings: stm32: add bindings for ML-AHB interconnect
>   dt-bindings: remoteproc: add bindings for stm32 remote processor
>     driver
>   remoteproc: stm32: add an ST stm32_rproc driver
>   ARM: dts: stm32: add m4 remoteproc support on STM32MP157c
>   ARM: dts: stm32: declare copro reserved memories on STM32MP157c-ed1
>   ARM: dts: stm32: enable m4 coprocessor support on STM32MP157c-ed1
>   ARM: dts: stm32: declare copro reserved memories on STM32MP157a-dk1
>   ARM: dts: stm32: enable m4 coprocessor support on STM32MP157a-dk1
> 
>  .../devicetree/bindings/arm/stm32/mlahb.txt        |  37 ++
>  .../devicetree/bindings/remoteproc/stm32-rproc.txt |  63 +++
>  arch/arm/boot/dts/stm32mp157a-dk1.dts              |  52 ++
>  arch/arm/boot/dts/stm32mp157c-ed1.dts              |  52 ++
>  arch/arm/boot/dts/stm32mp157c.dtsi                 |  20 +
>  drivers/remoteproc/Kconfig                         |  15 +
>  drivers/remoteproc/Makefile                        |   1 +
>  drivers/remoteproc/stm32_rproc.c                   | 628 +++++++++++++++++++++
>  8 files changed, 868 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
>  create mode 100644 drivers/remoteproc/stm32_rproc.c
> 
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
