Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7AB366099
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Apr 2021 22:05:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 433DCC5719E;
	Tue, 20 Apr 2021 20:05:21 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3619C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Apr 2021 20:05:18 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso14446091otl.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Apr 2021 13:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q+tqxQ3Q6LhOcEipZ0QTYi59icJlUnRrh9D6XQ8uUeU=;
 b=eEA3ik2507opM9lU6Ryz2R/7xW0jCqedo+o3AcXUbpcupYSMeV/8ku011HBPUCRBj7
 4lbedcO9RxraRzd8HDi3p5L+s190aCn4+rZzPOpRhdDK6jmAIqGqSPuMQG6f9ISeSrxB
 vTalNt7E3SU8LUbjbBlJPocNJpsQ/3p5ebj7uSxc6DVME1yp6iBEXHrI0uzqQrK0SNtO
 l5wuRtJGpP80Y/YlHeZKbGgVfEwW5Il0OoT5VbHaxkEURi2TeDn5JM3ZiheUoWwsl6gQ
 hgdxZRWdp6ousQ6Br+i+owH+kITkvp41Z8Fmawl8XUZZfzNLX2Tux4Do8vjI9h4F5Zu2
 RCqA==
X-Gm-Message-State: AOAM531T1QzLXXtjK0N4C1v6WHHQlPKXTU9H88W8Kr/YUB2Lst//XpcV
 6cxiyeWN1NdiiUca5KhYrH+81N2lcQ==
X-Google-Smtp-Source: ABdhPJwZSSIoC6uF19n5L31wsl9PPxvexohOI6uFjQn+6nFP41e9RiqwlbBELQAmTV3cAnRwZOgc6g==
X-Received: by 2002:a05:6830:2241:: with SMTP id
 t1mr20241162otd.126.1618949117716; 
 Tue, 20 Apr 2021 13:05:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u4sm19112ool.25.2021.04.20.13.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 13:05:17 -0700 (PDT)
Received: (nullmailer pid 3723485 invoked by uid 1000);
 Tue, 20 Apr 2021 20:05:16 -0000
Date: Tue, 20 Apr 2021 15:05:16 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20210420200516.GA3723455@robh.at.kernel.org>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-9-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415101037.1465-9-alexandre.torgue@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/13] dt-bindings: net: document ptp_ref
	clk in dwmac
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

On Thu, 15 Apr 2021 12:10:32 +0200, Alexandre Torgue wrote:
> ptp_ref clk has been added in DT but not documented which makes yaml
> validation failed:
> 
> ethernet@5800a000: clocks: [[6, 105], [6, 103], [6, 104], [6, 123],
> [6, 169], [6, 112]] is too long
> ethernet@5800a000: clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx',
> 'eth-ck', 'ptp_ref', 'ethstp'] is too long
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
