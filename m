Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D95443DE21A
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Aug 2021 00:09:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88658C597BC;
	Mon,  2 Aug 2021 22:09:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DB14C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Aug 2021 22:09:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5284260E78;
 Mon,  2 Aug 2021 22:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627942159;
 bh=fLVQF/t6wPWp+qJ9ehM/MjUmrMCRd15NX4dAGPwnH68=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=JnPV96lgFzoQstMQbGsvksvar5yILQC1BQO2UksHvxMQiepiHEnWO9xePi+uK9v0z
 WFRVrFzTzlg2ctvNmaenXiFfqBK3FJV24+CgCmDs/4StoUIIwCuKy8390REyGA11Xm
 nTxIop+8V2RlOB0IhEj8yCiyVvu/1j5Qh+F1WCOJ/DH0mTv0Lk2R9hRrSYTHMY8XhW
 RYOheQ3Dhf439zEG09uNyGr+vQ3sOzy9XnHS6ozSL3ayUqoFSKPQn8uapzTLa4FmbN
 ZsMirZ/JMBRfzYHmdJX7gc+oI5r+S2Q2XpM0B0Wg20G2eJ1Wwkl69+BL6B6THFmQ2b
 35bWXI8U/pylQ==
MIME-Version: 1.0
In-Reply-To: <1371790418.70998.1627846630234@mail1.libero.it>
References: <20210725160725.10788-1-dariobin@libero.it>
 <CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com>
 <1926284813.753014.1627553002984@mail1.libero.it>
 <CAPTRvH=R822osk86tRJqJCPNYY85t8t90+HJWcz43iASbcg2Jw@mail.gmail.com>
 <1371790418.70998.1627846630234@mail1.libero.it>
From: Stephen Boyd <sboyd@kernel.org>
To: Dario Binacchi <dariobin@libero.it>, Dillon Hua <dillonhua@gmail.com>
Date: Mon, 02 Aug 2021 15:09:17 -0700
Message-ID: <162794215799.714452.17355927940378699473@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-clk@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [RESEND PATCH v4] clk: stm32f4: fix post divisor
	setup for I2S/SAI PLLs
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

Quoting Dario Binacchi (2021-08-01 12:37:10)
> 
> As said in a previous email to Stephen, the patch I submitted fixes commit 517633ef630e
> ("clk: stm32f4: Add post divisor for I2S & SAI PLLs"), so IMHO it should not be dropped from the tree.
> What Dillon suggested should instead be fixed by another patch.

Ok. I'll send off the fix to Linus today.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
