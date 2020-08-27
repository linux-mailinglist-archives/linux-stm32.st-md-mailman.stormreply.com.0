Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D71E254449
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Aug 2020 13:29:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7C33C32EA6;
	Thu, 27 Aug 2020 11:29:04 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3677C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 11:29:03 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id si26so7127005ejb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 04:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iXm+BK1XseUH+QiQCNWCtflu2oIe/pb8DPKprrM24Fk=;
 b=qEXYtCKY8qYC2dAGILpBBTAIah/SompR96immdMnIqU3gYtESolE3LrKFNmD545WRF
 dL71ad7mOEEPXmDJ50kin/5CGuCQ5X9eRNLQLlFzOVO/hCYfPDKAIFpR3EgVr1Bgsvfl
 sf54YzLNFjRTVmM8WkSKwbCc09/h9ASOsuHU+8skU0aGrGuWPslk9PK9Sg6JOcDqPqyZ
 qfVLGVsP6abByNjDAaKnffmYADaET1tdybkrJ3y7BzJkEjHsqoyvvF0ujEw4QzvSZM3R
 i4pSMD4+iTfcz4IRY3DM6xbUM+5l1jT5/vCMJ3bboSeok3KIq/udJJu5Clr/hESv+x7v
 vybA==
X-Gm-Message-State: AOAM5310cnxn7GyKRQwSHuh8+gHj0mSZrOGGQj2occPNxTM/dS39Rh4C
 paHkzoH0lPg4mD7qh4D04qw=
X-Google-Smtp-Source: ABdhPJyEwtZ0NCeIt0EbDqNivfcPk1e08kNJdKFzd3GWd/Lf1IHJnIxd+vov5vkjwPfN2ooxo9kx2A==
X-Received: by 2002:a17:906:8d8:: with SMTP id
 o24mr19868792eje.384.1598527743036; 
 Thu, 27 Aug 2020 04:29:03 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id o8sm1631358eji.34.2020.08.27.04.29.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Aug 2020 04:29:02 -0700 (PDT)
Date: Thu, 27 Aug 2020 13:28:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-ID: <20200827112859.GA11849@kozik-lap>
References: <20200826145153.10444-1-krzk@kernel.org>
 <20200827122605.0000770f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827122605.0000770f@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Beniamin Bia <beniamin.bia@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 01/16] iio: accel: bma180: Simplify with
	dev_err_probe()
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

On Thu, Aug 27, 2020 at 12:26:05PM +0100, Jonathan Cameron wrote:
> On Wed, 26 Aug 2020 16:51:38 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Please make sure to send v2 to linux-iio@vger.kernel.org

Sure, my bad.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
