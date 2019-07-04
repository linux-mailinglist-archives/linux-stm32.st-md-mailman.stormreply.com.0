Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A8D5F756
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 13:46:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76C82C10C93
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 11:46:20 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2696DCBB4C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2019 11:11:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p13so6168377wru.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jul 2019 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=l8xOwRoeewzebcQAt1yKxsHLrRV9J9YjppTfdC6bYO4=;
 b=AcU/Og0Im9zeCUoAjQfz6t1TPM7Mfh0ysWoMMrnoAxopui+jfwRP+8ITrmS17IrY1C
 KEs0UE42QQXFtM3Plib24n04BsaZx7YpdSdT+lXwkDmW5UXo5AVmjENp8T4Yk5L4W3qL
 ya3qtdkWWGhERgwew7vMxaZiQ0oib0yFn8XnrueuwqH8INdv94RXEj/zk8dU3Gtn4O0A
 6EwHajqBOaWPjJJmtSLrm8PZE5Ma9nIUkyig0AkkUrnFH46TF6oLK4F+36SuPCPJzrid
 vsMqp3WqEkNc7NWqF0JoS9TZcj/Wt9C7JFdlMtv8VS6Ms36Kj4I2IsGthBfqv69AJ3yx
 KAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=l8xOwRoeewzebcQAt1yKxsHLrRV9J9YjppTfdC6bYO4=;
 b=nBxtm+U36C6FEfDJuSPMKTjFtc9jUYRbjQBTFM9iY+FfHqYD2cwQbYUHadMAudPUd8
 YxOz9ss3mTjLOdK5eX3HVrOipKS1K7n1kQMXvjXef50drztjBHrngik8ym7m2RZo5OYy
 856byoKS9umWQmXJAvJeKnVVJyYviA31vUceGcijXjlwIbvSay8tnPxY+vpDBQIFAKMl
 /WlXuSLFuyWVEIHIdSIxri4DinRs35Fyh9T4doXnWqhsET3fPxBDPTMfD3kFpcqD7AhT
 kbp2TdDiIlFDi8xTBNu0zL+j0v/TcJA4D72AM+8/wHR+rFyGYbA330HVoAWATZVvkVql
 a/vg==
X-Gm-Message-State: APjAAAWT1Pk4M1e3dzviP9rEB0LOdr2AqvzsoeTiUhD3ipn7jYPG8xng
 QhTDUqlchR76bHFNIgw36egNSQ==
X-Google-Smtp-Source: APXvYqwc3n6Z1DTK4DI0irtOTjnyQp+cY9JrkG89Fk1+0XQ7A/1JudehcvBrF5/bUdDdbNSumzT99A==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr32763692wrn.54.1562238673665; 
 Thu, 04 Jul 2019 04:11:13 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
 by smtp.gmail.com with ESMTPSA id r4sm4942586wrv.34.2019.07.04.04.11.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 04:11:12 -0700 (PDT)
Date: Thu, 4 Jul 2019 14:11:09 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190704111109.GA12011@apalos>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <20190704120018.4523a119@carbon>
 <BN8PR12MB3266BC5322AADFAC49D9BAFAD3FA0@BN8PR12MB3266.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN8PR12MB3266BC5322AADFAC49D9BAFAD3FA0@BN8PR12MB3266.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 04 Jul 2019 11:46:18 +0000
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

On Thu, Jul 04, 2019 at 10:13:37AM +0000, Jose Abreu wrote:
> From: Jesper Dangaard Brouer <brouer@redhat.com>
> 
> > The page_pool DMA mapping cannot be "kept" when page traveling into the
> > network stack attached to an SKB.  (Ilias and I have a long term plan[1]
> > to allow this, but you cannot do it ATM).
> 
> The reason I recycle the page is this previous call to:
> 
> 	skb_copy_to_linear_data()
> 
> So, technically, I'm syncing to CPU the page(s) and then memcpy to a 
> previously allocated SKB ... So it's safe to just recycle the mapping I 
> think.
> 
> Its kind of using bounce buffers and I do see performance gain in this 
> (I think the reason is because my setup uses swiotlb for DMA mapping).

Maybe. Have you tested this on big/small packets?
Can you do a test with 64b/128b and 1024b for example?
The memcpy might be cheap for the small sized packets (and cheaper than the dma
map/unmap)

> 
> Anyway, I'm open to some suggestions on how to improve this ...
> 
> > Also remember that the page_pool requires you driver to do the DMA-sync
> > operation.  I see a dma_sync_single_for_cpu(), but I didn't see a
> > dma_sync_single_for_device() (well, I noticed one getting removed).
> > (For some HW Ilias tells me that the dma_sync_single_for_device can be
> > elided, so maybe this can still be correct for you).
> 
> My HW just needs descriptors refilled which are in different coherent 
> region so I don't see any reason for dma_sync_single_for_device() ...
I am abit overloaded at the moment. I'll try to have a look at this and get back
to you

Cheers
/Ilias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
