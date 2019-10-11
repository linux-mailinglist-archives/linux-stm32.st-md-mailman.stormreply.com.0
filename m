Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D347D47AE
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 20:35:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16D03C36B0D;
	Fri, 11 Oct 2019 18:35:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77857C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 18:35:51 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9F9121835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 18:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570818950;
 bh=A5YOLiudlL0Gvx464VUE58c30d6rI4J9IqV4RnnkINE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j2Jx140EfZQIJRX0dYyL3J6GOIkXmJ368acn55TvtSBODydawj8Y0KD0mlX9UzyTK
 7ffpydWRR1A5SxdNtOZTgttoO9TXOQzK8iGZHBDpF+Y9kEwnkG7coNzNpYE99dsd+E
 RIGMEiT/MBcLwi6f/XX4XzYcYyotPgnNrmas27OY=
Received: by mail-qk1-f181.google.com with SMTP id y189so9809561qkc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 11:35:49 -0700 (PDT)
X-Gm-Message-State: APjAAAVE41eZRFAMcxBpMr9vC+pL8Hk3yfXyBfyVfyl+lvJob5Fzcxbq
 3BmTb98ZOnvBBJMfwyZz3XIhzaIhk7GM9elWpw==
X-Google-Smtp-Source: APXvYqwlcinnHLXWLenq8pR6e91BSf9cbUBSFPZzD4ss00JlOJSDW7Rcbsj1Vl/qGAwEzfHWNc9WXzuxsF5qr3W+Uc0=
X-Received: by 2002:a05:620a:136e:: with SMTP id
 d14mr16942465qkl.393.1570818949084; 
 Fri, 11 Oct 2019 11:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191002152253.16393-1-benjamin.gaignard@st.com>
In-Reply-To: <20191002152253.16393-1-benjamin.gaignard@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 11 Oct 2019 13:35:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKcvPNAL69WRgFbbRmLLyVpeCOarcnMY=wJR-hgVD06GA@mail.gmail.com>
Message-ID: <CAL_JsqKcvPNAL69WRgFbbRmLLyVpeCOarcnMY=wJR-hgVD06GA@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: Convert stm32 timer
	bindings to json-schema
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

On Wed, Oct 2, 2019 at 10:23 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert the STM32 timer binding to DT schema format using json-schema
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/timer/st,stm32-timer.txt   | 22 -----------
>  .../devicetree/bindings/timer/st,stm32-timer.yaml  | 46 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/st,stm32-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/st,stm32-timer.yaml

Same comments on other conversions apply here.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
