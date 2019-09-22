Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D58AEBABD8
	for <lists+linux-stm32@lfdr.de>; Sun, 22 Sep 2019 23:56:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86F79C35E01;
	Sun, 22 Sep 2019 21:56:48 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0D92C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Sep 2019 21:56:47 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w10so6798394pgj.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Sep 2019 14:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=hImOzMJ05KmBv4g1KzY6JsfY72PzUxGoGBvm1paBJpM=;
 b=LGqOAQrDCH7KD0IkMFNMW57vSH55x+6WbDjd+go1NQvZ9dUbZq/P8FVdunL40Hde4j
 2vjuAIMWnuCjHR4/pgoOyWvSSlh8IA/OFZnDV3Mv+7twIMdSIc1Z6X57Uj6bPn6orJuQ
 +2zQy8jS4pFoMfk9EVpO2Pgg2XN+zaNhWWaeairm6fQz0eWyUwSPTWWRiOuilW+ltgsM
 Uic0to6pKBNioMBtARf8M26aP7qmc9AqrVgQs41vDHouCR5T0fSnKnJor93xoaEP7LKw
 8r9EtllMMhHvjvK7TD93tWAZqqev2J++wziySKgO5Aj1IWl+nkOmU25P0vYlR7hzA/6q
 Ob7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=hImOzMJ05KmBv4g1KzY6JsfY72PzUxGoGBvm1paBJpM=;
 b=kObwwngeBWnxwi8Xj6pwdy+2UQMFJPoLKZ9AqsFjSllcFkVQPDfwFNSBYY3+lN/QSw
 6TbSltzuT+MDoKfYaDZYCkrid7toD+RkfJ2W9gVzWCOfy7g540mGO7g824Y+1+ey7Epl
 hAl7Rwu3h3HzwropRYC9ao7RtV52HSAUJPza2yHhZP87Fl/K/WeeQuIROrYLEo3a7diq
 jKIf5+dDrGtneDGIAgtop/+ZOSY9ZOxw3SdJAT97Ib6GSuEKByLkz1EL3uH/B5MXsMcK
 c9mnRjgkmdahzAX7AeC/We5Et1Rjn8LF+l8KdmCcGAPwtf/Q+HpR/oDfJbhsjvcdnpJG
 IGaw==
X-Gm-Message-State: APjAAAWevrP99B26yP5l5400XOsLrRPhHtjFmeMRY0yRzGqLkG2SOEvY
 GkKSsURLWghB21dAMPhRI8+i0A==
X-Google-Smtp-Source: APXvYqyC8GFMaLszqNzF5bZkrveNmENlCSweZt7S0Z8Fa1QnU/6Bl4atw0oHwiEOelkywLGWoSjI5w==
X-Received: by 2002:a63:358a:: with SMTP id c132mr26480848pga.32.1569189406117; 
 Sun, 22 Sep 2019 14:56:46 -0700 (PDT)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id e192sm10967639pfh.83.2019.09.22.14.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2019 14:56:45 -0700 (PDT)
Date: Sun, 22 Sep 2019 14:56:42 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190922145642.55453135@cakuba.netronome.com>
In-Reply-To: <f35fa5a51f52fc1ef17a0a9ecd470e2a6792b3f8.1568887745.git.joabreu@synopsys.com>
References: <f35fa5a51f52fc1ef17a0a9ecd470e2a6792b3f8.1568887745.git.joabreu@synopsys.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: selftests: Flow Control
 test can also run with ASYM Pause
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

On Thu, 19 Sep 2019 12:09:49 +0200, Jose Abreu wrote:
> The Flow Control selftest is also available with ASYM Pause. Lets add
> this check to the test and fix eventual false positive failures.
> 
> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>

Hi Jose! 

Thanks for the patch it looks good, seems like you posted it from 
a slightly different email address than was used for signoff:

From: Jose Abreu <Jose.Abreu@synopsys.com>
vs
Signed-off-by: Jose Abreu <joabreu@synopsys.com>

Could you please fix and repost? Automation may get upset otherwise.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
