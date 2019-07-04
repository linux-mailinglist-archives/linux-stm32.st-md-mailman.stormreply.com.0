Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6AA5FB00
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 17:38:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D19F5C35E01
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 15:38:09 +0000 (UTC)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4859C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2019 15:38:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2CC44300DA2B;
 Thu,  4 Jul 2019 15:38:07 +0000 (UTC)
Received: from carbon (ovpn-200-17.brq.redhat.com [10.40.200.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59BBC968DD;
 Thu,  4 Jul 2019 15:38:00 +0000 (UTC)
Date: Thu, 4 Jul 2019 17:37:58 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190704173758.6d985aa3@carbon>
In-Reply-To: <fd2b12e6fc99f6064b0c04e1baae24328d16289f.1562252534.git.joabreu@synopsys.com>
References: <cover.1562252534.git.joabreu@synopsys.com>
 <fd2b12e6fc99f6064b0c04e1baae24328d16289f.1562252534.git.joabreu@synopsys.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 04 Jul 2019 15:38:07 +0000 (UTC)
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Arnd Bergmann <arnd@arndb.de>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 brouer@redhat.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: Introducing
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

On Thu,  4 Jul 2019 17:04:14 +0200
Jose Abreu <Jose.Abreu@synopsys.com> wrote:

> @@ -1498,8 +1480,9 @@ static void free_dma_rx_desc_resources(struct stmmac_priv *priv)
>  					  sizeof(struct dma_extended_desc),
>  					  rx_q->dma_erx, rx_q->dma_rx_phy);
>  
> -		kfree(rx_q->rx_skbuff_dma);
> -		kfree(rx_q->rx_skbuff);
> +		kfree(rx_q->buf_pool);
> +		if (rx_q->page_pool && page_pool_request_shutdown(rx_q->page_pool))
> +			page_pool_free(rx_q->page_pool);
>  	}
>  }

This code is okay, but I would likely write it as:

  if (rx_q->page_pool) {
	page_pool_request_shutdown(rx_q->page_pool));
	page_pool_free(rx_q->page_pool);
  }

Because (as you noticed) page_pool_free() have some API misuse checks,
that will get triggered, and thus provide a warning of you forget to
update this when driver evolves.

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
