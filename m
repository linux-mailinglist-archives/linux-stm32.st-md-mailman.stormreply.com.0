Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B35132A38
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 16:42:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73628C36B0B;
	Tue,  7 Jan 2020 15:42:28 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3999C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 15:42:25 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id bd4so23344651plb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2020 07:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mOKAUWML1TFTWaJ7wVdgP8BJ4Cjz8s+9gtXGI6Ex/jk=;
 b=gSW7HO4pTdqJxlWVKCR6uhC6jdezVM9/xLJYNkDAbKHsfQnU2Bksu127W3XS1FH0NP
 MjGwlvOUDUOY7W8PL3RGhQt857tc2SA98S0w0pminHY6s4pVzjgXG8V9zF7Yb5LYOEgA
 +Ci7RaZfP4MSX9kP/OAoqqzMnsHIg0B3iyvQFrCOY7rvwAztaVkBadB34g7JBF1lWkzG
 Q+pqOxLIXkknIc9CP7QrVRtpK4N528gW6wV9ko9n8h8esaOebmAr8gu4VsFUiWAD+YJb
 pZmDkVkH2Uh5M7YAv6n4or5zr9KL04ETPHtqqi7wGwplDUS82kU6kOxZ+x9rEPdSE5yD
 DMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mOKAUWML1TFTWaJ7wVdgP8BJ4Cjz8s+9gtXGI6Ex/jk=;
 b=oKhehJpnMFo01aNj7V8HxUeoqcQHygA7kBZ629ZoGvs/5lwSsDOz1V9EXOl7cvF+NX
 OZeRXEIeJUEN8yHYG5k+lNL/SWGQq2FanLuvXMr4BL+wICLLrGMZH3K76TKCiDS5ypxF
 UWHirp8au4xFqtsqt6URab9EZajRNLY/Pd4NyIpzrxHbyDOXcxhw92sY8bJ2tcpFAs7r
 B4RJ1aSjV/MQG+flTU5irlb01pZrLOGubUwYkV4zCDyjvgldRDTdxyasDAhqQobo9rXe
 BymSWjs4UmZMyI5dipRqiB2ILQXNQD8WruXDUDTBGYCEeEs3pB4H5dDRp9H4W/ZKEcOR
 I+qA==
X-Gm-Message-State: APjAAAWrs/XJXWHOP33NVRhdv/QDaNhLrendh8ip4lbbaz2RWrYnsiU/
 lALHm09ZlD7tAJNl6T0Srps=
X-Google-Smtp-Source: APXvYqzjYtn6/YzemGIzVUvI2cuoJB3lK2QEiULmrIBAz8zX6VTg45Sni+wFU8KjnZOEKfD9mOElDA==
X-Received: by 2002:a17:902:7209:: with SMTP id
 ba9mr289009plb.118.1578411744231; 
 Tue, 07 Jan 2020 07:42:24 -0800 (PST)
Received: from localhost (199.168.140.36.16clouds.com. [199.168.140.36])
 by smtp.gmail.com with ESMTPSA id v10sm141764pgk.24.2020.01.07.07.42.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jan 2020 07:42:23 -0800 (PST)
Date: Tue, 7 Jan 2020 23:42:21 +0800
From: Dejin Zheng <zhengdejin5@gmail.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20200107154221.GA28873@nuc8i5>
References: <20200107150254.28604-1-zhengdejin5@gmail.com>
 <BN8PR12MB3266661B136050259B5F7FD7D33F0@BN8PR12MB3266.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN8PR12MB3266661B136050259B5F7FD7D33F0@BN8PR12MB3266.namprd12.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "corbet@lwn.net" <corbet@lwn.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] Documentation: networking: device
 drivers: sync stmmac_mdio_bus_data info
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

On Tue, Jan 07, 2020 at 03:16:10PM +0000, Jose Abreu wrote:
> From: Dejin Zheng <zhengdejin5@gmail.com>
> Date: Jan/07/2020, 15:02:54 (UTC+00:00)
> 
> > Recent changes in the stmmac driver, it removes the phy_reset hook
> > from struct stmmac_mdio_bus_data by commit <fead5b1b5838ba2>, and
> > add the member of needs_reset to struct stmmac_mdio_bus_data by
> > commit <1a981c0586c0387>.
> 
> This will file be no longer maitained as we are moving to RST format. 
> Please see [1].
> 
> [1] https://patchwork.ozlabs.org/project/netdev/list/?series=151601
>
Jose, Thanks for your notice, abandon this commit.

BR,
dejin

> ---
> Thanks,
> Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
