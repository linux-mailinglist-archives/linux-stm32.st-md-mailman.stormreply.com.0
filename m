Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0C21BE32B
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 17:54:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D1B3C36B0D;
	Wed, 29 Apr 2020 15:54:47 +0000 (UTC)
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86356C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 15:50:05 +0000 (UTC)
Received: from 185.80.35.16 (185.80.35.16) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.415)
 id bb23fa4412e3993e; Wed, 29 Apr 2020 17:50:04 +0200
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Date: Wed, 29 Apr 2020 17:50:04 +0200
Message-ID: <7657495.QyJl4BcWH5@kreacher>
In-Reply-To: <20200424114058.21199-1-benjamin.gaignard@st.com>
References: <20200424114058.21199-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Apr 2020 15:54:46 +0000
Cc: mcoquelin.stm32@gmail.com, len.brown@intel.com, viresh.kumar@linaro.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Patrick Bellasi <patrick.bellasi@arm.com>, pavel@ucw.cz, mchehab@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [RFC 0/3] Introduce cpufreq minimum load QoS
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

On Friday, April 24, 2020 1:40:55 PM CEST Benjamin Gaignard wrote:
> When start streaming from the sensor the CPU load could remain very low 
> because almost all the capture pipeline is done in hardware (i.e. without 
> using the CPU) and let believe to cpufreq governor that it could use lower 
> frequencies. If the governor decides to use a too low frequency that 
> becomes a problem when we need to acknowledge the interrupt during the 
> blanking time.
> The delay to ack the interrupt and perform all the other actions before
> the next frame is very short and doesn't allow to the cpufreq governor to
> provide the required burst of power. That led to drop the half of the frames.
> 
> To avoid this problem, DCMI driver informs the cpufreq governors by adding
> a cpufreq minimum load QoS resquest.

This seems to be addressing a use case that can be addressed with the help of
utilization clamps with less power overhead.

Thanks!



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
