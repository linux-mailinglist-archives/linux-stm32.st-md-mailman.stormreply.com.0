Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5786DEDFA
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 02:40:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F03DC35E07
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 00:40:56 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10A95C35E04
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 00:40:54 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id y64so4360853oia.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 17:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O9Iv2ifY4GsmV3xCWRy9UVgazV3TsrIbtMu5jqaQZhI=;
 b=PwSXZ6ZUwf1Y/TiEgggisk99vUfhEYaOXqPgcVH6SsLMDqBGS2ZF4PbPfIRWuZYao2
 n5ysYepkJ+POmTaPtPF1VX+jYCo7nTIrMJ/cKl3A0mPXYT/3ChJC5IVu0zmyxFO5ObyX
 RrIOMNkP1JgVIdZodPsc684hRmQiUflG4SELkocesKkIaFWFkACA2ugpXmr+7JezYdT+
 HEJQiq8PSVQFezRKtczFYbs8FVGu3W8z6ZCVTz1+KBkmmKPGJIa4YkWq3vqx2IvQ6mv6
 EeOYyxo2eOHaeIdSNjSO2ZHY9bm3eB2o0Q1Uv2bHbzZX6Q+kq0P/zC7AN0G5uqWCclgJ
 9eJQ==
X-Gm-Message-State: APjAAAXifok44d3DAbvt0PBpH55JAQKtOjNEx4qlm7pAwt+bSdZR9THd
 +s/0sCxsDM+gyId5FzGiaw==
X-Google-Smtp-Source: APXvYqwW5hh4WHQNcZx2ZksEDdkJIORlNN4TTBlJnzXoGja1o5FdA+MCwncVj6Y4QcnHR11jUvZouA==
X-Received: by 2002:aca:5fc4:: with SMTP id t187mr1302241oib.18.1556584852646; 
 Mon, 29 Apr 2019 17:40:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k65sm14951243oia.16.2019.04.29.17.40.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 17:40:51 -0700 (PDT)
Date: Mon, 29 Apr 2019 19:40:51 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20190430004051.GA7391@bogus>
References: <1555426699-5340-1-git-send-email-fabien.dessenne@st.com>
 <1555426699-5340-3-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555426699-5340-3-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/8] dt-bindings: remoteproc: add
 bindings for stm32 remote processor driver
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

On Tue, Apr 16, 2019 at 04:58:13PM +0200, Fabien Dessenne wrote:
> Add the device tree bindings document for the stm32 remoteproc devices.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  .../devicetree/bindings/remoteproc/stm32-rproc.txt | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> new file mode 100644
> index 0000000..430132c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> @@ -0,0 +1,64 @@
> +STMicroelectronics STM32 Remoteproc
> +-----------------------------------
> +This document defines the binding for the remoteproc component that loads and
> +boots firmwares on the ST32MP family chipset.
> +
> +Required properties:
> +- compatible:	Must be "st,stm32mp1-m4"
> +- reg:		Address ranges of the remote processor dedicated memories.
> +		The parent node should provide an appropriate ranges property
> +		for properly translating these into bus addresses.

dma-ranges, but that's independent of 'reg'.

It needs to list how many reg regions and what they are.

> +- resets:	Reference to a reset controller asserting the remote processor.
> +- st,syscfg-holdboot: Reference to the system configuration which holds the
> +		remote processor reset hold boot
> +	1st cell: phandle of syscon block
> +	2nd cell: register offset containing the hold boot setting
> +	3rd cell: register bitmask for the hold boot field
> +- st,syscfg-tz: Reference to the system configuration which holds the RCC trust
> +		zone mode
> +	1st cell: phandle to syscon block
> +	2nd cell: register offset containing the RCC trust zone mode setting
> +	3rd cell: register bitmask for the RCC trust zone mode bit
> +
> +Optional properties:
> +- interrupts:	Should contain the watchdog interrupt
> +- mboxes:	This property is required only if the rpmsg/virtio functionality
> +		is used. List of phandle and mailbox channel specifiers:
> +		- a channel (a) used to communicate through virtqueues with the
> +		  remote proc.
> +		  Bi-directional channel:
> +		      - from local to remote = send message
> +		      - from remote to local = send message ack
> +		- a channel (b) working the opposite direction of channel (a)
> +		- a channel (c) used by the local proc to notify the remote proc
> +		  that it is about to be shut down.
> +		  Unidirectional channel:
> +		      - from local to remote, where ACK from the remote means
> +		        that it is ready for shutdown
> +- mbox-names:	This property is required if the mboxes property is used.
> +		- must be "vq0" for channel (a)
> +		- must be "vq1" for channel (b)
> +		- must be "shutdown" for channel (c)
> +- memory-region: List of phandles to the reserved memory regions associated with
> +		the remoteproc device. This is variable and describes the
> +		memories shared with the remote processor (eg: remoteproc
> +		firmware and carveouts, rpmsg vrings, ...).
> +		(see ../reserved-memory/reserved-memory.txt)
> +- st,syscfg-pdds: Reference to the system configuration which holds the remote
> +		processor deep sleep setting
> +	1st cell: phandle to syscon block
> +	2nd cell: register offset containing the deep sleep setting
> +	3rd cell: register bitmask for the deep sleep bit
> +- auto_boot:	If defined, when remoteproc is probed, it loads the default
> +		firmware and starts the remote processor.

st,auto-boot

> +
> +Example:
> +	m4_rproc: m4@0 {
> +		compatible = "st,stm32mp1-m4";
> +		reg = <0x00000000 0x10000>,
> +		      <0x10000000 0x40000>,
> +		      <0x30000000 0x40000>;
> +		resets = <&rcc MCU_R>;
> +		st,syscfg-holdboot = <&rcc 0x10C 0x1>;
> +		st,syscfg-tz = <&rcc 0x000 0x1>;
> +	};
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
