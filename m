Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17207715DD0
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 13:50:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2900C6A614;
	Tue, 30 May 2023 11:50:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC82CC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 11:50:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBB386248B;
 Tue, 30 May 2023 11:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B71C433EF;
 Tue, 30 May 2023 11:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685447455;
 bh=SViWi0+Y4kbgwEoqaRBIp7trJUsmkoHJ1///quKPNaU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AO9jIJI5J2nA828jr2PkKwj+6C364JzJWqF8mpWKYd4CDfypOI+q3EM9k9worYCsA
 Un3WWEGUUzGQ0zX4LwJNNh8McRU3AU06GhIw4IyLfwQDN0YF19skoE3w9CXNhh+Ton
 yHdNp/RilsgzF8IOeV7cJEmXd9oXVc/gNpCun+3Mhf7Q6jLIPILsN2IgGHzarwUKwN
 VsGrMy5ljOsP2sqjt7lklXRlIUKM2QWYDP/KTb3qHGZ6KPiMZYO5NzkQyRIAiPTkdv
 CV5WzYCmE3oqGf7VP5a2rdncPzjxIwVFndN8in7O5J0Hj4eZ2cvanat7SiQshYT9WY
 8NHBgqf4yC4sw==
Message-ID: <1b4eba7e-2771-b0c8-ec23-2ed882374e5d@kernel.org>
Date: Tue, 30 May 2023 13:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
References: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
 <20230523091350.292221-4-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230523091350.292221-4-arnaud.pouliquen@foss.st.com>
Cc: op-tee@lists.trustedfirmware.org, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [RFC PATCH 3/4] dt-bindings: remoteproc: add
 compatibility for TEE support
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

On 23/05/2023 11:13, Arnaud Pouliquen wrote:
> Rework compatibility description according to the support of
> the authenticated firmware relying on OP-TEE authentication.
> 
> The expected behavior is:
> - with legacy compatible "st,stm32mp1-m4" the Linux kernel loads a
>   non-signed (ELF) firmware image,
> - with compatible "st,stm32mp1-m4-tee" the Linux kernel load a signed
>   firmware image. In this case it calls TEE services to manage the firmware
>   loading and the remoteproc life-cycle.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 33 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 3 deletions(-)

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested.
Please resend and include all necessary entries.

Because of above and RFC, I assume there is no need for review. Just to
be clear - that's a no.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
