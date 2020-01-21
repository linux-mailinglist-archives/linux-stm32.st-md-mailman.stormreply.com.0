Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1D144729
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2020 23:22:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27605C36B0C;
	Tue, 21 Jan 2020 22:22:23 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82EE9C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 22:22:21 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id i1so4196791oie.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 14:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qQ3ESJiwe24A1xRRFdOQ68BgNu0jHa+2w0EJEUQi0CQ=;
 b=HZcIVRyujBbTTYUtq2uwGMmFCeJioLCdcoBFKulbRmvoV4XemXvlg60hx38Ho48Txw
 7AV8UgpxeI7t2dOk8ElgizJrCrqba66uuxWlF7xD/LqAvEJuc9cR6wJW3hz6f0YmJqy7
 Pjq5YztYojgjrKhjIVUXGAk0aE6P5agsetn8yzfAT7hq+wEHoNuTzjZeBZOE3KPThq5r
 VprsQ4+bj131Ktxy1n+/ovc6titB+zabEJbDSyQr+xGiH/dlbSFAAx24aNczMCrc7SEe
 sFqScKc5GjWdTbAJI/H5sQoia+FFXvHpiAFOl2Tac7oqYi9Sm1ZmfGiDZZywOmvhAQKs
 oQLw==
X-Gm-Message-State: APjAAAWk6XLq0G1sRDdunLkyJ8hQdJHwVq0llxvUi6wGtPhtCrrAyQT9
 HpGKz8O8afYS4dhhhgqFuQ==
X-Google-Smtp-Source: APXvYqxtTBp1m0NoVYXgYISnqaA0oCc25esO/7iHUU9wqcKpSAWyGjQXwz90q4B5a30iOmY5CpuOCw==
X-Received: by 2002:a05:6808:1c6:: with SMTP id
 x6mr4687242oic.49.1579645340281; 
 Tue, 21 Jan 2020 14:22:20 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m185sm12426354oia.26.2020.01.21.14.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 14:22:19 -0800 (PST)
Received: (nullmailer pid 11864 invoked by uid 1000);
 Tue, 21 Jan 2020 22:22:18 -0000
Date: Tue, 21 Jan 2020 16:22:18 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200121222218.GA9196@bogus>
References: <20200114123329.3792-1-benjamin.gaignard@st.com>
 <20200114123329.3792-3-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114123329.3792-3-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] dt-bindings: serial: Convert STM32
 UART to json-schema
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

On Tue, Jan 14, 2020 at 01:33:29PM +0100, Benjamin Gaignard wrote:
> Convert STM32 UART bindings to json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/serial/st,stm32-uart.yaml  | 80 ++++++++++++++++++++++
>  .../devicetree/bindings/serial/st,stm32-usart.txt  | 57 ---------------
>  2 files changed, 80 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
>  delete mode 100644 Documentation/devicetree/bindings/serial/st,stm32-usart.txt

Looks fine. Will pick up when you respin patch 1.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
