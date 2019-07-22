Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D1A6FD9F
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jul 2019 12:18:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EDBCCCAA7E;
	Mon, 22 Jul 2019 10:18:36 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26AF3C0857B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 10:18:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s15so13377582wmj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 03:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+GcrJc5mWQ55cEUCcfbBZGMvLQ78HJvPwtodMDzyle8=;
 b=G/KTQPys8CcucScPfqsgmQtz62QdZqLEo1kJwQNA+4eLiF2asiNiddgtT/h14Ix94U
 /CdTawyAL79G+1ILA0FvrmO8i2FryDf4LH9+Yj6o4XGqgEMRSjeMmCPzYQxKNpoZorLo
 z+SV+ac1Cei6AWdxZ6IceFB28kHbysTzIUNOHaUoxyQYbqkiAlOpN1troV3WXeI636me
 pZqpRxgTA+gDotUsJGcbBrxF3vsWRMbB6fLgmFb0seU6n83Fjiw5lyPCsGhKFl5VBVtA
 j6RauOuX7Z0lH14cBe9PTdWl14HxQfSyO24r5I9K866EX/AQa4BQydrhG1rhbyb9i/j+
 VvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+GcrJc5mWQ55cEUCcfbBZGMvLQ78HJvPwtodMDzyle8=;
 b=muslNbof+kNho+6yXXwjKycGUzrbvLn2MAj0GN7njqSucgM2AnPjCEc5719pH7hnL7
 9R87+hduV9UKe7AqYnlgiGVSeXqQyYBN8J5qN4yiqROQ9GChzeUC8ERp/WlsSFcl2C1J
 FTVKpbLoa2kRFsccKqOH6z/OW+pr7x2NKbxGZEKiagS4F8ohLgQsxQeGcJBaF/B7PJcl
 t0U6n1s7FjfCaOGkKM9bVmuJAXOl7EA729larnSvgrtFJuVcWlNlNf97SDK1eKLr79ob
 FPL4AknmfxdJJr0F3+cQV/EpODltWR9gCzEcJs4Vh/NlUnERDZ9Y5ttM/LPLAk5ta0gO
 InDA==
X-Gm-Message-State: APjAAAW1ZlKfWESPge0jBNTcD83Dn4XUA5Zoq8pUy23Y0Z886sYAqh4X
 hSuo28fH3Df4DowJLooGXrZZsQ==
X-Google-Smtp-Source: APXvYqwWpeo4gQ4edBUy9N5k3STiDsB6fnGJqOqO58p5YopawrIHfEaaX/V07cjOuiVOf8ftj5mijg==
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr64661606wma.120.1563790714647; 
 Mon, 22 Jul 2019 03:18:34 -0700 (PDT)
Received: from apalos (athedsl-373703.home.otenet.gr. [79.131.11.197])
 by smtp.gmail.com with ESMTPSA id f17sm34005987wmf.27.2019.07.22.03.18.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 03:18:33 -0700 (PDT)
Date: Mon, 22 Jul 2019 13:18:30 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190722101830.GA24948@apalos>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
 <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
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

On Thu, Jul 18, 2019 at 07:48:04AM +0000, Jose Abreu wrote:
> From: Jon Hunter <jonathanh@nvidia.com>
> Date: Jul/17/2019, 19:58:53 (UTC+00:00)
> 
> > Let me know if you have any thoughts.
> 
> Can you try attached patch ?
> 

The log says  someone calls panic() right?
Can we trye and figure were that happens during the stmmac init phase?

Thanks
/Ilias

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
