Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4427C7AB70A
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 19:16:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6749C6A5EF;
	Fri, 22 Sep 2023 17:16:09 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3490FC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 17:16:09 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1c5db4925f9so17205615ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695402967; x=1696007767;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ICBL/Q4jbf7cf4gR4zY8Pazn4MfjoBlTiYldqzQrKlk=;
 b=GhJynI+YkGewWTPefgUfw0mE5Yp9aXDewaDl89ItA9NCzH7NQMG9YBtWMEdbScC/Am
 3wPYMQPjc88K326bKLbEF3dCWuCv3LEVIqFCGQETTt1TnL064IGt+m3dvGcF61Jqm8w8
 X4giSYz/AedrEeIp3vLQLrG1kLH7K5eqBrx+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695402967; x=1696007767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ICBL/Q4jbf7cf4gR4zY8Pazn4MfjoBlTiYldqzQrKlk=;
 b=QCGOg3nUC8OqpLcl3OuiT4b0Qh5/0V5t70wJ6W6xNZHrqmcjznd899qtFrUhLOzLz2
 l7M+zH539TlkSo6KVtNDlalx+cvqUWdBmJaXJvpjoo9aVajSXViFUbrxNQxN9A5TvG0l
 UwwE9PRRW2xVbWqkvPiBBUAY2EhnLqER5D0PDl/Ufq0s+/SgWR7EfYVwu8BOFV9H2WmI
 z0QZ77QqHRdgFd8tVdEFOQc2iIE4ttmbLcpLaUU/HRehGxBqtbifOP1Jc14cx51+dWco
 Q8j9b5c5PzR3D8jHuolSr3bNSPWGm94K1VSdMXvj8JBEzrKj/qBd8K/AUJbOrO5ZHDwl
 RvWA==
X-Gm-Message-State: AOJu0YwuSJoEBGbmU5c2UXkYaAHHJHlGPWrGj+7POoqT79wMche5URad
 najNP9U21qUr3XtVLozivw7EEQ==
X-Google-Smtp-Source: AGHT+IEetMJnHs5bBcV9L3R6HPyKeQTS1z7sgSklrhHfcojQhz5I0wr5ShzBfZ21ocAxIbhohXa34w==
X-Received: by 2002:a17:902:a416:b0:1c5:ecfc:2650 with SMTP id
 p22-20020a170902a41600b001c5ecfc2650mr2175732plq.14.1695402967593; 
 Fri, 22 Sep 2023 10:16:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 ji18-20020a170903325200b001bdbe6c86a9sm3742195plb.225.2023.09.22.10.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 10:16:07 -0700 (PDT)
Date: Fri, 22 Sep 2023 10:16:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <202309221015.AB63726@keescook>
References: <20230817235428.never.111-kees@kernel.org>
 <202309151307.F3341BD5A@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202309151307.F3341BD5A@keescook>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-hardening@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lars-Peter Clausen <lars@metafoo.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, asahi@lists.linux.dev,
 Jie Hai <haijie1@huawei.com>, Sven Peter <sven@svenpeter.dev>,
 linux-arm-msm@vger.kernel.org, Green Wan <green.wan@sifive.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Yu Kuai <yukuai3@huawei.com>,
 linux-tegra@vger.kernel.org, Jordy Zomer <jordy@pwning.systems>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Zhou Wang <wangzhou1@hisilicon.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/21] dmaengine: Annotate with
	__counted_by
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

On Fri, Sep 15, 2023 at 01:08:30PM -0700, Kees Cook wrote:
> Just a ping on the series... how do these look to you, Vinod?
> 
> If you want I can carry them in my tree. Please let me know.

I'm now carrying this in my for-next/hardening tree. Let me know if
you'd prefer I drop it.

Thanks!

-Kees

-- 
Kees Cook
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
