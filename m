Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 045202038C9
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2020 16:08:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A69A1C36B0C;
	Mon, 22 Jun 2020 14:08:54 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 030A9C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2020 14:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9vEISF7TWp4PVYxt3CdWfsfRlefupfkWdhA6vLj/Xbo=; b=yMzjpl2rKmL+O6LAgB9GEvUyb0
 9X4fIz/rdeMe4YQB9qLCOellIZRE2SZ+yulpXWO8iAPS4u9TKGgnTYSPvYGfHhgVKxk6zi/g2DKgj
 vTdH582CvU7oQAwe05NDp1Snf7XWJh0D3r6kHWJZQzkiEFACKmRR2qM0iID9VXkqxw7O97/qSI8Cr
 +Vjwc2UUh8/6kypFLgjmgAdXE6Zet9YOaiq3UvSO+Tcl2wzGS7/Z5xe8bENWRkzVGZ/ME3iVqflF2
 7IEb75+K+lwFHjhPkacBQ1hbu4x1jTLlNrqTI359p3wCiAmfdRvEPP5b7879KixLKaf7VspBLr+x5
 p+iUp5jg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:51552 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1jnN7x-0004eb-11; Mon, 22 Jun 2020 10:08:49 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>
References: <cover.1592341702.git.vilhelm.gray@gmail.com>
 <afe40ef2e24ecaca44fc229f7983cf4cde3374a8.1592341702.git.vilhelm.gray@gmail.com>
 <8fae0659-56df-c0b5-7c0d-220feefed2b4@lechnology.com>
 <20200621195347.GA59797@shinobu>
From: David Lechner <david@lechnology.com>
Message-ID: <47ad15e7-05ce-d463-b6af-406365b3c3b4@lechnology.com>
Date: Mon, 22 Jun 2020 09:08:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200621195347.GA59797@shinobu>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/4] counter: Add character device
	interface
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

On 6/21/20 2:53 PM, William Breathitt Gray wrote:
> Synapses simply indicate a change in a Count value

Ah, ok. I understand now that synapse is the wrong term for things like
the change in direction event or error events.

> For example, in the dual-axes positioning table scenario, a user
> application would likely want to know the exact X and Y position at the
> time of a given event -- that means an event should provide two Count
> values (and possibly associated device flags) when it occurs. I'm not
> sure yet how the struct counter_event should be defined in order to
> support this; we will need to indicate the format of data as well as
> provide the data itself. Perhaps, we can handle this by providing an
> unique id field so that only a single datum (e.g. a single count value)
> is provided via the value field, but subsequent struct counter_event
> items share the same id so that the user knows that a particular datum
> is part of a larger group of data for a specific event.

The timestamp could act as the "id" to correlate multiple values of a
single event.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
