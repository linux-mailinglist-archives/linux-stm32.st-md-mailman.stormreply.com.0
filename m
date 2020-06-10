Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5511F1F59D4
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2020 19:16:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED6E4C36B21;
	Wed, 10 Jun 2020 17:16:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 105DDC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 17:16:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5611C1FB;
 Wed, 10 Jun 2020 10:16:33 -0700 (PDT)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B65A63F6CF;
 Wed, 10 Jun 2020 10:16:31 -0700 (PDT)
References: <20200610122500.4304-1-benjamin.gaignard@st.com>
 <20200610122500.4304-3-benjamin.gaignard@st.com>
User-agent: mu4e 0.9.17; emacs 26.3
From: Valentin Schneider <valentin.schneider@arm.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
In-reply-to: <20200610122500.4304-3-benjamin.gaignard@st.com>
Date: Wed, 10 Jun 2020 18:16:25 +0100
Message-ID: <jhjsgf23kpi.mognet@arm.com>
MIME-Version: 1.0
Cc: vincent.guittot@linaro.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, mchehab@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 2/3] media: stm32-dcmi: Set minimum
	cpufreq requirement
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


On 10/06/20 13:24, Benjamin Gaignard wrote:
> Before start streaming set cpufreq minimum frequency requirement.
> The cpufreq governor will adapt the frequencies and we will have
> no latency for handling interrupts.
> The frequency requirement is retrieved from the device-tree node.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

For the cpufreq qos / irq affinity parts:

Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
