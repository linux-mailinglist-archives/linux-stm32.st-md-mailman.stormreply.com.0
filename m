Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 614186470C4
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Dec 2022 14:29:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 091E9C6507A;
	Thu,  8 Dec 2022 13:29:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1013AC63327
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 13:29:45 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B6D4381253;
 Thu,  8 Dec 2022 14:29:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670506185;
 bh=4DUlDl/WRb+joognhqzxZXXrzOnsFPGMBRZ1TB+CdOc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TjpbJ/CGkLC7AM+EJQws5+wvpfR5lVl/dZ4lRQJqG2bc1xD6fpeatceMPEkO9qQdR
 tzzszcc3XJEezvHtc3NhmBuuO9eruhE/FJHD+E25j3R3qnJfooQX3JBjLSBYvM4hsE
 O/y4EdnHxhfB4vQ3n1ruEDUSDVatnOsfofZMzY7GxUt59VZxxwPfeIdMxt7okRVz/n
 rPsHtTJ4ps6cUNmNo6kRJaOLnztUm025+DBa7o8q5HJ93fQLWEX2N67e5mB//AMMIO
 yLQ+XQGSOYQGaDu8DSq5idI0MZ58xK96He+e5VCoYY9rH0aKr9xqsSwW0nJhzCDSN7
 PHk+Kf7LQc2+Q==
Message-ID: <a984e2aa-1fbf-4b6b-9326-d926221740d8@denx.de>
Date: Thu, 8 Dec 2022 14:19:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Valentin CARON <valentin.caron@foss.st.com>
References: <20221207195929.160267-1-marex@denx.de>
 <34ec91a2-2089-65ba-d5bb-fed03cda63b7@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <34ec91a2-2089-65ba-d5bb-fed03cda63b7@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 Jean Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] serial: stm32: Move hard IRQ handling to
 threaded interrupt context
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/8/22 11:18, Valentin CARON wrote:
> Hi Marek,

Hi,

> I've got a patch in the same spirit in downstream.
> The test campaign reveals performance issues with this patch.
> 
> In fact, hard IRQ have been introduced in stm32-usart driver to solve 
> performance issues due to short FIFO size (16 bytes).
> 
> We are currently testing another patch, similar as your RFC proposition, 
> for RT context.
> But results are not ready yet. We can wait them before merging this big 
> change into driver ?

Can you post your patch as an RFC so others can test as well ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
