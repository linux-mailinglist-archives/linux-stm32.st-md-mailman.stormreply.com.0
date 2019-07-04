Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C45FAE7
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 17:33:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45F86C35E01
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 15:33:43 +0000 (UTC)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E1A4C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2019 15:33:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D50423091799;
 Thu,  4 Jul 2019 15:33:36 +0000 (UTC)
Received: from carbon (ovpn-200-17.brq.redhat.com [10.40.200.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1B4A84290;
 Thu,  4 Jul 2019 15:33:26 +0000 (UTC)
Date: Thu, 4 Jul 2019 17:33:25 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190704173325.2e21cc93@carbon>
In-Reply-To: <BYAPR12MB32692AA2F18A530D56383739D3FA0@BYAPR12MB3269.namprd12.prod.outlook.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <20190704113916.665de2ec@carbon>
 <BYAPR12MB326902688C3F40BB3DA6EEEBD3FA0@BYAPR12MB3269.namprd12.prod.outlook.com>
 <20190704170920.1e81ed6e@carbon>
 <BYAPR12MB32692AA2F18A530D56383739D3FA0@BYAPR12MB3269.namprd12.prod.outlook.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 04 Jul 2019 15:33:40 +0000 (UTC)
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, brouer@redhat.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>,
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

On Thu, 4 Jul 2019 15:18:19 +0000
Jose Abreu <Jose.Abreu@synopsys.com> wrote:

> From: Jesper Dangaard Brouer <brouer@redhat.com>
> 
> > You can just use page_pool_free() (p.s I'm working on reintroducing
> > page_pool_destroy wrapper).  As you say, you will not have in-flight
> > frames/pages in this driver use-case.  
> 
> Well, if I remove the request_shutdown() it will trigger the "API usage 
> violation" WARN ...
> 
> I think this is due to alloc cache only be freed in request_shutdown(), 
> or I'm having some leak :D

Sorry, for not being clear.  You of-cause first have to call
page_pool_request_shutdown() and then call page_pool_free().

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
