Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BD213950B
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 16:38:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECB4FC36B0C;
	Mon, 13 Jan 2020 15:38:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03871C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 15:38:28 +0000 (UTC)
Received: from cakuba (unknown [172.58.35.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7AE5B2081E;
 Mon, 13 Jan 2020 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578929906;
 bh=bX9YRUVI9N9taZ7dKBzdjLKR6nfZeVIfQUP6a1vX5wk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xPD+krhCRzny3JzZjs74BEqmj9izM20v9fSN3j9y/3AT6f7wKT03fkIopy6WsVTIm
 v5aJ0t7UF/+ntk1gXnLixFiqjj5/lBflCv46GVv3veD23+4yDyyS8r8sD62kr0SZj7
 DBkQfECI9Aqg4ZJqem8tNG+lShVIhNgqckeUox+A=
Date: Mon, 13 Jan 2020 07:38:22 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20200113073822.3f063e28@cakuba>
In-Reply-To: <BN8PR12MB3266B96942463C01A0F367A9D3350@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1578920366.git.Jose.Abreu@synopsys.com>
 <d72e539523e063a391391d447ece658524bb8d57.1578920366.git.Jose.Abreu@synopsys.com>
 <20200113065406.54bb324b@cakuba>
 <BN8PR12MB3266B96942463C01A0F367A9D3350@BN8PR12MB3266.namprd12.prod.outlook.com>
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"          <linux-arm-kernel@lists.infradead.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	linux-kernel@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"linux-stm32@st-md-mailman.stormreply.com\"          <linux-stm32@st-md-mailman.stormreply.com>,  " linux-arm-kernel@lists.infradead."org," Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	"David S. Miller" <davem@davemloft.net>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/8] net: stmmac: Initial
	support for TBS
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

On Mon, 13 Jan 2020 15:10:31 +0000, Jose Abreu wrote:
> From: Jakub Kicinski <kuba@kernel.org>
> Date: Jan/13/2020, 14:54:06 (UTC+00:00)
> 
> > > +	int tbs_avail;
> > > +	int tbs_en;  
> > 
> > These could be bool or a bitfield?  
> 
> I'm tempted to not use bool since I read this: 
> https://lkml.org/lkml/2017/11/21/384

Right :) "or a bitfield", int > bool > bitfield
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
