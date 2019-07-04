Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C7F5F8D9
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 15:06:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64CCEC0E33D
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 13:06:40 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 891A8C0E33B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2019 13:06:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s15so6112273wmj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jul 2019 06:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=C0G7rBJyorAv/Go9XW+5KlxgxsrwAo4Lw8h4E0AK/9g=;
 b=MhGHCbNxmBGEX9gNxaF9U5CCJT+qFuz/qiepbdulPX4tk3cpmHk4Nr1cvq+wO4v/6O
 +ybPFIWjxCRzO1VplawtIKym3JIWT6EL6KCC/kXweTg1xEDf6xWNuutL6xnTVP49ECPa
 2IkTuBaIC5U5cDvAdCksqgV+emWw2anAu4XaajfBHQH+ALVYgz1c6h+ms+nDnaWgQOva
 rqS7dM0i2zAeunc7L6TMtRFiWjbF3j2AT0T4kRNj/OsD5XYRsUZqdy268I4EZYTBHRYU
 uIRnNbFdGgRz8D3Ch5iqC9sB+WrvfT8Jn9Q1LiX+atRzygQnXvRv4EHdOsgMgxoxXFdA
 tX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=C0G7rBJyorAv/Go9XW+5KlxgxsrwAo4Lw8h4E0AK/9g=;
 b=g3Ij6Ab4A+Iw/ijl3vqIaoiXffZMGz81gsmrkeUBWjx2RmAAxc5Nrt3vNJ3WuIpNwD
 jZfxO/94I5KR1Uvl+VD9cXzWQmQklc3XJR1ANUic4X+jji8sjJ1S3KAupMQ7vJXrh3fY
 Z/LgejJHwY5Lge1nXA/KcbqMz3Rcsy6GJWyh8AYBQ2M73Rj7NmNLi8aG0neVzZ9+bCyf
 lZrMa2Xh6Fg/qcu7IOC4GYZJwV4ICWgfFaSe5BaB6x43xjC/DwgNgdSZivUSL9n58+nF
 6NzBKFfcWsGhRkPmwp79gVjx5kIMHqlWUkANEQyf7wpeGLQdM7bwuXw/2X7AreTOk1fi
 FaXg==
X-Gm-Message-State: APjAAAX+xk5eFAqAgjrQLBgmOEuBQ3XJ4vCIGwMy2pr86cFeXui0nQi3
 PC1YyYt/fdIRS/qTzWDkiqpdrQ==
X-Google-Smtp-Source: APXvYqwpVkbCltdiX25gOjc+VVQOWtlzTko4TXdJA9hHxN3MnWxEKL9t/rTxGIvJpQMJWxILKQIjYA==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr11648016wmc.22.1562245599046; 
 Thu, 04 Jul 2019 06:06:39 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
 by smtp.gmail.com with ESMTPSA id p4sm4889734wrs.35.2019.07.04.06.06.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 06:06:38 -0700 (PDT)
Date: Thu, 4 Jul 2019 16:06:35 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190704130635.GA10412@apalos>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <20190704120018.4523a119@carbon>
 <BN8PR12MB3266BC5322AADFAC49D9BAFAD3FA0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190704135414.0dd5df76@carbon> <20190704120441.GA6866@apalos>
 <BYAPR12MB3269D4FAAC5307A224D60A08D3FA0@BYAPR12MB3269.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR12MB3269D4FAAC5307A224D60A08D3FA0@BYAPR12MB3269.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
 support for Page Pool
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

Hi Jose, 

> Thank you all for your review comments !
> 
> From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> 
> > That's why i was concerned on what will happen on > 1000b frames and what the
> > memory pressure is going to be. 
> > The trade off here is copying vs mapping/unmapping.
> 
> Well, the performance numbers I mentioned are for TSO with default MTU 
> (1500) and using iperf3 with zero-copy. Here follows netperf:
> 

Ok i guess this should be fine. Here's why.
You'll allocate an extra memory from page pool API which equals
the number of descriptors * 1 page.
You also allocate SKB's to copy the data and recycle the page pool buffers.
So page_pool won't add any significant memory pressure since we expect *all*
it's buffers to be recycled. 
The SKBs are allocated anyway in the current driver so bottom line you trade off
some memory (the page_pool buffers) + a memcpy per packet and skip the dma
map/unmap which is the bottleneck in your hardware. 
I think it's fine

Cheers
/Ilias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
