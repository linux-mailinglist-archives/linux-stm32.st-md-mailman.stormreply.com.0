Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB28ACDAF7
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Jun 2025 11:25:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B7ABC32E92;
	Wed,  4 Jun 2025 09:25:30 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAD9BC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jun 2025 09:25:28 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1749029128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CBMX+Dz0hWZn3u61TkOzdRuiBkDqYb9ZBGePVYRUeEQ=;
 b=lv6FqFP85RWJPgGMKGEGoJ8fiGRsIIzMsw+C7cOmFYjjXtG04m4TEDQemXvE7cgRqsFXPd
 z9JmC21/h22ICKLDGvKbWODuvaDqs1n9z/wmi0MKitLwCrTJfTEK8Cw43K8HfBBSIqx9wh
 tdgflehM7qIrUvaSaUCiYk+xjd3buIE1rmUwM7VxmhxRXxwzqU1W7LouUzJ8HtQnbPt4Fk
 /ZR0KEJSqjZr+rcPyt2msUa9iKw4Ekmr+/WyajSXe4MayGDWAODKZuGRTaCBAPcxKsWR8r
 ebYighvkz1eHgXHDMZJFMMFF2aKbIigPm42zRd/JYfSUq5yvKHeQArPiweohMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1749029128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CBMX+Dz0hWZn3u61TkOzdRuiBkDqYb9ZBGePVYRUeEQ=;
 b=c1OQwLBvCBk634Hl0YCxp3U/Cu3qvpqjvtecbJXF8ha8hIIihbmfAWiMhx8D+fuTdnN108
 EqoL8TGlJRCOImBw==
To: Daniel Lezcano <daniel.lezcano@linaro.org>, daniel.lezcano@linaro.org
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-8-daniel.lezcano@linaro.org>
Date: Wed, 04 Jun 2025 11:25:27 +0200
Message-ID: <87wm9rq2ns.ffs@tglx>
MIME-Version: 1.0
Cc: Nam Cao <namcao@linutronix.de>, Marco Elver <elver@google.com>,
 Will McVicker <willmcvicker@google.com>, Saravan Kanna <saravanak@google.com>,
 Samuel Holland <samuel@sholland.org>, Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 John Stulz <jstultz@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 7/7] time: Export symbol for
 sched_clock register function
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

On Mon, Jun 02 2025 at 17:18, Daniel Lezcano wrote:

$Subject:  s@time:@time/sched_clock:@

please

Other than that:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
