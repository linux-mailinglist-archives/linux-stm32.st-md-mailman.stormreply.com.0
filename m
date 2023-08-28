Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC4178A488
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 04:15:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46B73C65E58;
	Mon, 28 Aug 2023 02:15:07 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6395C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 02:15:04 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2690803a368so655199a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 19:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693188903; x=1693793703;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ue+CxuSDtyTYvwjrZI51+SYlIrMgm3DrcfChgWaBaBo=;
 b=nu5VR2Q+m1SzatCfC+hiOx+NVGpmEIkwaZr1G/mduu1Y5LvTzOcLCKxska7gXWnhLb
 mltuXuK3HtTBiIvy0jvowUXvuZpQximHM/OwQniwyH665wS4zqUSpbaFaA2GBjeecPQ2
 oJIRT2Ao3/Mow+d1AgW9QRImffrecJpH4dTPrdEDC67yFngsLtriWe37E4aIw6Jhhevw
 jBAn3x0DsZjYleT5Rx+rO+duCAbQicDoA4oITqZAUBuvjoa/2DGb2DJLwxQmyr3iwevm
 ZQl5NVWt2AzX9odPmBNw+z15Atk8uLtgGZxBADSxKzZdSuojpY99u5M+9Hg//zWZTfxg
 3A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693188903; x=1693793703;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ue+CxuSDtyTYvwjrZI51+SYlIrMgm3DrcfChgWaBaBo=;
 b=bPaatyOrloTklFr8wzn9mC4IW6U4oe1IvMZ8MOiSh2BDxFRomOP5CuzOmWGUtycMuh
 7YvnXvshn7oTC5VpRpwdl+tVcjPOVsjRReNawQviyGhOeUrXFl0vSvZ/ylAkn/aZGVw+
 6KKfm5JyKJn8iWX/jGtJ726ss860vNp2LVa/MeDasv0URUOvCtI6ojlT2nAI/Yj4liJQ
 AXBT7mfEibL0+4e7WrHZEKm1m1AwlT+dYmhrK2IS0dP4RwJARwsKXjUq2HQQHwTvAT42
 jAoW9umwkJN/3xq0ZfvsIoHzvtKaWDHYEAe6KnPpBnkIfsPKWc8FSSrLnAJK4n4Q+YvX
 T0uA==
X-Gm-Message-State: AOJu0YwZlq3MTnvbteSukOkglz6Bv5KYd/HU9gfVtGAGhTJXZTaBymPy
 9M7pqSWsVq8dMIGKZkssP8M=
X-Google-Smtp-Source: AGHT+IHN8Fl8NxVm4qZhrKUgyN/xyGKFzRASfTqOLe7L6wZHAG3dfs74EByha7PmEEiqFWQ/Y/1/3w==
X-Received: by 2002:a05:6a00:2d88:b0:68b:68de:5848 with SMTP id
 fb8-20020a056a002d8800b0068b68de5848mr17170824pfb.3.1693188903353; 
 Sun, 27 Aug 2023 19:15:03 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2601:640:8000:54:e2d5:5eff:fea5:802f])
 by smtp.gmail.com with ESMTPSA id
 bm2-20020a056a00320200b00687196f369esm5520055pfb.62.2023.08.27.19.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Aug 2023 19:15:02 -0700 (PDT)
Date: Sun, 27 Aug 2023 19:15:00 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <ZOwDJB5cFEPGEoPk@hoboy.vegasvil.org>
References: <20230824-stmmac-subsecond-inc-cleanup-v1-0-e0b9f7c18b37@redhat.com>
 <20230824-stmmac-subsecond-inc-cleanup-v1-7-e0b9f7c18b37@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230824-stmmac-subsecond-inc-cleanup-v1-7-e0b9f7c18b37@redhat.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 7/7] net: stmmac: Make PTP
 reference clock references more clear
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

On Thu, Aug 24, 2023 at 01:32:58PM -0500, Andrew Halaney wrote:

> @@ -34,14 +34,14 @@ static void config_sub_second_increment(void __iomem *ioaddr,
>  	 * increment to twice the number of nanoseconds of a clock cycle.
>  	 * The calculation of the default_addend value by the caller will set it
>  	 * to mid-range = 2^31 when the remainder of this division is zero,
> -	 * which will make the accumulator overflow once every 2 ptp_clock
> +	 * which will make the accumulator overflow once every 2 clk_ptp_rate
>  	 * cycles, adding twice the number of nanoseconds of a clock cycle :
> -	 * 2 * NSEC_PER_SEC / ptp_clock.
> +	 * 2 * NSEC_PER_SEC / clk_ptp_rate.
>  	 */

This part of the driver is complete garbage.  But that isn't your fault.

Richard
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
