Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DA37697E2
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 15:44:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B103EC6B46E;
	Mon, 31 Jul 2023 13:44:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 123CAC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 13:44:46 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1b867f9198dso6748235ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690811085; x=1691415885;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Sv4eEdzpRIyrH/+IfcFPu37k/d42alZPDTBwvhPALFI=;
 b=Y4KZTJf6Zg4vd+GQMSfuZlbfhlt/uPZD/ssdSq5/j+48h4t+kiT5ixSs5Wk5Y0c3GI
 WUXxVX1OA69hw9n2c1MDsyYCKAT61tO2bp9T0N0JhG7DRc3Mbh0Abpc69l9GrTNbzBAv
 zJRWpX5aE/xeDuEW08utVJaESYyR7zVg0vQHKMVRGgC6OeMqKv97iuTPuX9OouHSQCwT
 05w/0lHYYu2x4BLHmyR2PWPVILkarG/vv/oF1S6+SFLND5Gq2hSjcFQcAvnrTFqPCmEb
 mZw/is82u6ExYSGtHh63NQxQdXAloVbkBcP5s4RQAnDkMT10tECPF2AdvdKdtG5wim6L
 5lTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690811085; x=1691415885;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sv4eEdzpRIyrH/+IfcFPu37k/d42alZPDTBwvhPALFI=;
 b=YItWN1ueHGbHpFIZuS6SuLHzuf+WknvXHfuGliNC2LanIwmmi/TXadspWzPJhJLytV
 Y+tUML/0XVH/wy2fIXBKzQf4BU4d66nL2fRiU0zStfbbCaAvG/cdKtnnTKbwsTpsNPV5
 RVAGCibdoxLCgKpwa+H1AAglxnS1bEkW8wF4eUeRC1sSAu+X1np2kEijyVXOX3FffAxv
 4PPoZSK6ZT5yXm0K7tlScYQqa8w048FS8LotFObBQPwgFyGu/2Li+CGWx2ILirlzJhzL
 NTXMxPvjs/qIJBXEzQfFeZO7GSivvwfdBtjUJVy5cV1p8ENWqN6teZVk/E7oaeiZ5dRj
 1nyg==
X-Gm-Message-State: ABy/qLboupmJ86jsfSFG5pPpnF+483DgzszOyzeWMfiDQDsQj2ioevF4
 fQ7nvLFJ4Stwi5IYoMpXfLA=
X-Google-Smtp-Source: APBJJlGwSw362RvhOsN/krp5kQpm7PrncDbtm9pJqXyP9PAQ0wbCdJ/rJiKLdsCDXDotQyhiu/4Ymg==
X-Received: by 2002:a17:90a:6c97:b0:263:730b:f568 with SMTP id
 y23-20020a17090a6c9700b00263730bf568mr6001069pjj.3.1690811085473; 
 Mon, 31 Jul 2023 06:44:45 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8000:54:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 iw3-20020a170903044300b001b9dadf8bd2sm8607834plb.190.2023.07.31.06.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 06:44:44 -0700 (PDT)
Date: Mon, 31 Jul 2023 06:44:42 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Johannes Zink <j.zink@pengutronix.de>
Message-ID: <ZMe6ykS6s9a/en8r@hoboy.vegasvil.org>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <ZMGIuKVP7BEotbrn@hoboy.vegasvil.org>
 <729dd79e-83aa-0237-1edd-1662a6ae28cd@pengutronix.de>
 <ZMJy6yt4CL250x6Q@hoboy.vegasvil.org>
 <de822fa6-16ca-381c-2cdf-7e983f29945b@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de822fa6-16ca-381c-2cdf-7e983f29945b@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 kernel test robot <lkp@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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

On Mon, Jul 31, 2023 at 09:00:29AM +0200, Johannes Zink wrote:

> I cannot tell for sure either, since I have datasheets for the i.MX8MP only.
> Maybe Kurt has some insights here, as he has additional hardware available
> for testing?

Maybe give the folks who make the dwc a call to clarify?
 
> Nevertheless, I am going to add a guard to only use the correction codepath
> on i.MX8MP in v3 for the time being, we can add other hardware later
> trivially if they support doing this.

Sure.

Thanks,
Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
