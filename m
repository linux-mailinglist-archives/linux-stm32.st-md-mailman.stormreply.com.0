Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0293663C68
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 22:04:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F00F2C9E7BC
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 20:04:57 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA28EC9E7BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2019 20:04:56 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u19so45854102ior.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jul 2019 13:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yMWvhTwdTx4eCPgZpMKqdo6YtJFGRY4W4k7r7rWwQq0=;
 b=WdjHJ406mFFeZz8H2h2SeuDzePcq76ipTN/NTIySLL0AR/77L79pI4KrLNetMUYqIr
 aOdWr+butpImRqEThXdGYP2YixGoI8iWgsqm34ltulJHaC1aL1qgdSRenzJolRGWJEQC
 9OjmgpCpQU1EQsVvZEs5Lzy8SoPIfqMyYucDrJNC7ptvhwwONv2/su4QZO4Bz4zsZAR7
 g6july3BLgb02tmmgWqzGTFfT7ncg8FwP8XH82kbm5Mn6rqXdOOyrDo1c1R9iPOv7Ao8
 YvQ0eBkO/+2Y4owg6Q0Z6vI9h8L/+uc0x4VSYeThXi+48+0xIIjkyQMWnoENMCSok0Ij
 tpRQ==
X-Gm-Message-State: APjAAAVybtIPmrWnMLu064Yxv0FmkqVA7jmQYgP2q4loPDy5oJNE34Qj
 2rk/y8RTbcBQDPpTCdv6EQ==
X-Google-Smtp-Source: APXvYqym6yoyImjtZ4uA33nv3VEFPdV5kZxtSC8ErJEyWJqeGfIzXNMCldgpv1NB9zrEilSNLO/USg==
X-Received: by 2002:a6b:6f09:: with SMTP id k9mr2513338ioc.223.1562702695542; 
 Tue, 09 Jul 2019 13:04:55 -0700 (PDT)
Received: from localhost ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id h19sm15504351iol.65.2019.07.09.13.04.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 13:04:55 -0700 (PDT)
Date: Tue, 9 Jul 2019 14:04:54 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190709200454.GA328@bogus>
References: <1560937925-8990-1-git-send-email-fabrice.gasnier@st.com>
 <1560937925-8990-2-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560937925-8990-2-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux@armlinux.org.uk, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bindings: pwm-stm32: add #pwm-cells
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

On Wed, 19 Jun 2019 11:52:01 +0200, Fabrice Gasnier wrote:
> STM32 Timers support generic 3 cells PWM bindings to encode PWM number,
> period and polarity as defined in pwm.txt.
> 
> Fixes: cd9a99c2f8e8 ("dt-bindings: pwm: Add STM32 bindings")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-stm32.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
