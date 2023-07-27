Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C2D765DB1
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jul 2023 23:05:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F2E8C6B463;
	Thu, 27 Jul 2023 21:05:00 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C164C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 21:04:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8884360003;
 Thu, 27 Jul 2023 21:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1690491899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tOY5b3y9jRLepq1BGsdeSApJYxOtzopsf/Bc3hO4kvk=;
 b=SQF1cOAZCL8tI3y3wag8IGoJi6glP2Pd2fcsnVDYCVkOaazyVankPSLGIeDvK3TKTY/gRZ
 rTnL9jKFWskJ/5W2muGV1MvhYnxUneA3BvYsifIzgdDl/1+BoJZYlJBGuwz4mQjDZ9+Qy0
 LQadGW+pBHvWSgz9GZ9AtJrvUuUUwrkNcNfHB0vpkcTSc/VPWYdP4CdfVNWOSHR8HScJnC
 tKTrW3k3qvIYJloqk70YEC1zOGS4YjOKWNyIoOfBcqVNp4wosOQu9KmoltrobBkPTYqqX0
 5cTZVMpzOF8WyVqxHij+97hUCeeOuUGxwP7nEMv//w4vGNaN4lVLlfnQzOygjQ==
Date: Thu, 27 Jul 2023 23:04:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <169049184164.460519.5513202583626147097.b4-ty@bootlin.com>
References: <20230705174357.353616-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705174357.353616-1-valentin.caron@foss.st.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
 Christophe Guibout <christophe.guibout@foss.st.com>,
 linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/7] rtc: stm32: multiple bug fixes and
	improvements
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


On Wed, 05 Jul 2023 19:43:50 +0200, Valentin Caron wrote:
> This series implements some bug fixes for theses issues:
> - typo issues
> - register read sequence issue
> - irq during pm callbacks issue
> 
> This series implements also some improvements:
> - don't switch to INIT mode uselessly
> - improve error printing during probe
> - improve rtc precision on stm32mp1
> 
> [...]

Applied, thanks!

[1/7] rtc: stm32: use the proper register sequence to read date/time
      commit: f69cb2d6034ddf8dae6848d29b9d4efba8cd4df9
[2/7] rtc: stm32: don't stop time counter if not needed
      commit: 1c18b8ec52396af6a6e20cd3450dc9bff0781ab8
[3/7] rtc: stm32: improve rtc precision
      commit: 2487925731b75961cf4b7d1d0d28d204b63787b9
[4/7] rtc: stm32: don't print an error on probe deferral
      commit: 95f7679c3ab2d032d935692426b6d9f7e681fd60
[5/7] rtc: stm32: change PM callbacks to "_noirq()"
      commit: fb9a7e5360dc8089097337a9685f6fed350a310f
[6/7] rtc: stm32: fix issues of stm32_rtc_valid_alrm function
      commit: 46828a5f89044b8e057f6bbb50ae2bac926a0fa2
[7/7] rtc: stm32: fix unnecessary parentheses
      commit: 650915ecd8f8cbb58e1ef55430f9e15ae03fd7d8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
