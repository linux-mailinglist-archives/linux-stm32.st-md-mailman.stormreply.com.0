Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DED88C263
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Aug 2019 22:57:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2582C35E02;
	Tue, 13 Aug 2019 20:57:36 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB312C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 20:57:35 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m2so7014821qki.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2019 13:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=bNfCPQHfFfS05Ua0jgfTWRkNVMemAI0m1k8K0MkNCfo=;
 b=YwV4nGNRSR1A1eVJ/QD41sekOqfOp8xgyNC95HHYPXad4HG7a2JDRShmZhBlpGQUUt
 WSHEMsmrJ19lmUCYMUrWkocjF2D0hTI4iyF5PpD0ZhSAQO+GkBFVViFj9Gx4u0oJPIWS
 y1GYX3DWqvmZ4Sjfdt+P0aNDrEQX9tP/jtldhK1rGqsPbAAoJ+Bk7SDMmzBcjGOfTvwg
 Pp/zVhGRjz7gsjbgYw3pqzG15i7zJ0RUecjBuDopi4mFQbblrWUTjCHFH52oWPytiFD4
 IVpRDmpauS0ZvJMBttPhzfi9MdcVF7kuk2lhyfa2uX4iQdFXBu9gUfwyrmRD5IvX2NgN
 LlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=bNfCPQHfFfS05Ua0jgfTWRkNVMemAI0m1k8K0MkNCfo=;
 b=rfe2Mj1tzmh0/9mZSAqSaVdSw/5i4TssFRhPDibpGKOpYfbaCoIJWzLrZqwvlPAUtz
 /kWgvanUSzHgvcsS5kHsXzCzzc2/QFRjmMzbjbNZFNRNTHGTuc0+UFqU7XOesR9pFFbm
 pzaCKyyDrfGmRj4ulEmluJYx5KvBcOhQmOxfNgliPI/481aAgb+Mf2ebOB38oYxgwzQR
 ZgqJVKH90bGlT7IrBIfC7WcYATadMXPbc6Y7de3+iBb5HNVV/QeslNtMcS/oQ64UWHMV
 IKgtaTW7VCFhA4wrmXSsFjTfoox4C9bxZJ4/SH412kXxdmqyZkPFhqBu0qgcZQyb31f8
 pkHw==
X-Gm-Message-State: APjAAAUV2JPT+TVbA9wN/RLYaaxDj1YFtRfcCdLlMdvmigOc4kEFY0Xc
 2pJqWg9v9pggFa0594t56cDe9Q==
X-Google-Smtp-Source: APXvYqxfiM+cvNMIUPbfi2x+FX0ul2aixQ+5yH92qTgQl+N7+EOdhtTpE+zWSqcR0Xy7ioIiApIKdw==
X-Received: by 2002:a37:b82:: with SMTP id 124mr33996866qkl.260.1565729854473; 
 Tue, 13 Aug 2019 13:57:34 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id d71sm11374918qkg.70.2019.08.13.13.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 13:57:34 -0700 (PDT)
Date: Tue, 13 Aug 2019 13:57:22 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190813135722.22ea671d@cakuba.netronome.com>
In-Reply-To: <195f374a0b46e5e65a691742fc2dbeffacfaf148.1565602974.git.joabreu@synopsys.com>
References: <cover.1565602974.git.joabreu@synopsys.com>
 <195f374a0b46e5e65a691742fc2dbeffacfaf148.1565602974.git.joabreu@synopsys.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 01/12] net: stmmac: Get
 correct timestamp values from XGMAC
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

On Mon, 12 Aug 2019 11:44:00 +0200, Jose Abreu wrote:
> TX Timestamp in XGMAC comes from MAC instead of descriptors. Implement
> this in a new callback.
> 
> Also, RX Timestamp in XGMAC must be cheked against corruption and we need
> a barrier to make sure that descriptor fields are read correctly.
> 
> Changes from v1:
> 	- Rework the get timestamp function (David)
> 
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>

The barrier sounds like it might be a bug fix, does it occur in he wild?

> @@ -113,13 +119,11 @@ static int dwxgmac2_get_rx_timestamp_status(void *desc, void *next_desc,
>  	unsigned int rdes3 = le32_to_cpu(p->des3);
>  	int ret = -EBUSY;
>  
> -	if (likely(rdes3 & XGMAC_RDES3_CDA)) {
> +	if (likely(rdes3 & XGMAC_RDES3_CDA))
>  		ret = dwxgmac2_rx_check_timestamp(next_desc);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return ret;
> +	if (!ret)
> +		return 1;
> +	return 0;

nit:

	return !ret;

>  }
>  
>  static void dwxgmac2_init_rx_desc(struct dma_desc *p, int disable_rx_ic,

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
