Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6973C828
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2019 12:08:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43F64C0B182
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2019 10:08:51 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 600B7C0B180
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 10:08:50 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id g13so19196751edu.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 03:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=upToNZmU1lMq7es+5zXvEQjyTF1NnvLf1/9ORQaZ1DE=;
 b=ddL3zBaa9cAF6n27ZaiQQ2E38/yEEPJVOTUfCmDC9ZlAclnB7WbNDSgJfREaWQfJdJ
 9RjQpkUS7JMG1z/qlHzNMfJlgB0teZcHpYWItRjAjgnE5OhbN7JJwqRxMVfIeLEhMPb9
 IHtlFa0L2xIBLrIXztnuDUrK/+Lua7WH+3dPBpDwwNtEVHdSEbT4uw5iinoCWtY7zqos
 /dxKhQXSNl8sTRhefO3ZopQ19y1yjhmIfW0rD0Y/VCfXI9PFpVc2R+iFGFcpY63ylAlN
 NPaV20oamvXCpFb2PRW184iQK0bYB2qckbTF1drc9DKV1uS7k8dH80eLU15KWFTxYoiE
 3jMQ==
X-Gm-Message-State: APjAAAUqL/sCnT1WBy1DyztXlPxUnn/44gSa4TtsbkLFCTOYJEQca4lp
 rI+RuYvY28RddV5l/lIS2YK4DSB5524=
X-Google-Smtp-Source: APXvYqzGiHOq2U0n+G76seHR66Y0eLrQ6znwtslzKJcz02hxR7yfaNchdLSV1XOQVvi9/TRXe+CIRA==
X-Received: by 2002:a50:9965:: with SMTP id l34mr45245772edb.152.1560247729155; 
 Tue, 11 Jun 2019 03:08:49 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46])
 by smtp.gmail.com with ESMTPSA id a9sm3675610edc.44.2019.06.11.03.08.47
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:08:47 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id n4so12274670wrw.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2019 03:08:47 -0700 (PDT)
X-Received: by 2002:adf:fd01:: with SMTP id e1mr23640588wrr.167.1560247727247; 
 Tue, 11 Jun 2019 03:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <af3a342a6cba1dda27763c13093a8fc060946c1e.1560158667.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <af3a342a6cba1dda27763c13093a8fc060946c1e.1560158667.git-series.maxime.ripard@bootlin.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 11 Jun 2019 18:08:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v66vKPeyvw56ROR-B=5Bzi7GVby1CXCjgQ5hnuUdPWX0cg@mail.gmail.com>
Message-ID: <CAGb2v66vKPeyvw56ROR-B=5Bzi7GVby1CXCjgQ5hnuUdPWX0cg@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 11/11] ARM: dts: sunxi: Switch to the
	generic PHY properties
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

On Mon, Jun 10, 2019 at 5:26 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The DWMAC specific properties to manage the PHY have been superseeded by
> the generic PHY properties. Let's move to it.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> This patch should go through arm-soc.
>
> Changes from v1:
>   - New patch
> ---
>  arch/arm/boot/dts/sun6i-a31-hummingbird.dts       |  6 +++---

Tested-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
