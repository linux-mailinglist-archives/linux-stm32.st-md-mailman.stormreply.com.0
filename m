Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0F74DFE5
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 22:59:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43E9DC6B457;
	Mon, 10 Jul 2023 20:59:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DEE1C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 20:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=BDD/kXWc4mPL62yQdsd+c6fXt0hPTnce16m0rj/81RY=; b=htzTmXFD7JiauLShb4XitpCS7w
 8NrlOm226PO1pz5G3bLJvyCbiln5ayI37MwfM0Hlxv5GtdEs/BEbG3SMdvf7W49J0cAJHGB+Qov8N
 6X3B4ngIwTRf9a8XHDcbk+upAESwIj9sCqT1VI2OV4Be4akMyftOG3HM/0gGYGDB3eXs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qIxyx-000z3A-MY; Mon, 10 Jul 2023 22:59:43 +0200
Date: Mon, 10 Jul 2023 22:59:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <80fe2a99-67fd-4c8f-86c8-b097faa8be31@lunn.ch>
References: <20230710201636.200412-1-ahalaney@redhat.com>
 <20230710201636.200412-2-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710201636.200412-2-ahalaney@redhat.com>
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 davem@davemloft.net, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, simon.horman@corigine.com,
 kuba@kernel.org, pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/3] net: stmmac:
 dwmac-qcom-ethqos: Use of_get_phy_mode() over device_get_phy_mode()
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

On Mon, Jul 10, 2023 at 03:06:37PM -0500, Andrew Halaney wrote:
> Since this driver only uses devicetree, let's move over to
> of_get_phy_mode(). That API has an explicit error return and produces a
> phy_interface_t directly instead of an int when representing the phy
> mode.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
