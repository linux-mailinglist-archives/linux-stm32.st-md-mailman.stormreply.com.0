Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFFE6A8839
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Mar 2023 19:05:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C90BC6A601;
	Thu,  2 Mar 2023 18:05:28 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46371C6A5FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Mar 2023 18:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677780326; x=1709316326;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Bf3iWqZn8ZHJC8UqH7R7YhZdFebd0SSSAZOsxRPZafQ=;
 b=FAk1QV9I5smq7qqltcvC32EiSTBcJVaNOgVnBzp2jYsGMKhX7VAK0dFX
 3v/xqU6+IFx/aCulek4YvO8yg0uZeKo+F35/4QGb9EzI6VZqFydfv61Gu
 A2RMLcCS/KneKZGniGbxEjCihK6mn900hcBYukuvHmXmPa0SLtRCZXKo8
 iCpZcPpButjYNhuzl6F1bm+3BLze+ZCFiAPLnuEUa4AUBQO/G/KMz91hg
 VoT7+QwSfu0a/pxe64HSFgOaBwAyqqdIIXAZiq3DPA6WHhicBMNDn3x79
 Cqq6PbxEKZwnQWZJMAtewKXW1U6rXDpprBLFsN3N7EvtOW8McLrumSbaX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="333522922"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="333522922"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 10:05:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004222764"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; d="scan'208";a="1004222764"
Received: from ubik.fi.intel.com (HELO localhost) ([10.237.72.184])
 by fmsmga005.fm.intel.com with ESMTP; 02 Mar 2023 10:05:20 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
In-Reply-To: <20230208124053.18533-1-quic_jinlmao@quicinc.com>
References: <20230208124053.18533-1-quic_jinlmao@quicinc.com>
Date: Thu, 02 Mar 2023 20:05:20 +0200
Message-ID: <87lekfni5b.fsf@ubik.fi.intel.com>
MIME-Version: 1.0
Cc: alexander.shishkin@linux.intel.com, linux-arm-msm@vger.kernel.org,
 Mao Jinlong <quic_jinlmao@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Tao Zhang <quic_taozha@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, Hao Zhang <quic_hazha@quicinc.com>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stm: class: Add MIPI OST protocol support
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

Mao Jinlong <quic_jinlmao@quicinc.com> writes:

> Add MIPI OST protocol support for stm to format the traces.

Missing an explanation of what OST is, what it's used for, how it is
different from the SyS-T and others.

> Framework copied from drivers/hwtracing/stm.p-sys-t.c as of

You mean stm/p_sys-t.c. Also, it's not a framework, it's a driver.

> commit d69d5e83110f ("stm class: Add MIPI SyS-T protocol
> support").

Why is this significant?

> diff --git a/drivers/hwtracing/stm/p_ost.c b/drivers/hwtracing/stm/p_ost.c
> new file mode 100644
> index 000000000000..2ca1a3fda57f
> --- /dev/null
> +++ b/drivers/hwtracing/stm/p_ost.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copied from drivers/hwtracing/stm.p-sys-t.c as of commit d69d5e83110f
> + * ("stm class: Add MIPI SyS-T protocol support").

Same as in the commit message.

[...]

> +#define OST_TOKEN_STARTSIMPLE		(0x10)
> +#define OST_VERSION_MIPI1		(0x10 << 8)
> +#define OST_ENTITY_FTRACE		(0x01 << 16)
> +#define OST_CONTROL_PROTOCOL		(0x0 << 24)

These could use an explanation.

> +#define DATA_HEADER (OST_TOKEN_STARTSIMPLE | OST_VERSION_MIPI1 | \
> +			OST_ENTITY_FTRACE | OST_CONTROL_PROTOCOL)

Does this mean that everything is ftrace? Because it's not.

> +
> +#define STM_MAKE_VERSION(ma, mi)	((ma << 8) | mi)
> +#define STM_HEADER_MAGIC		(0x5953)
> +
> +static ssize_t notrace ost_write(struct stm_data *data,
> +		struct stm_output *output, unsigned int chan,
> +		const char *buf, size_t count)
> +{
> +	unsigned int c = output->channel + chan;
> +	unsigned int m = output->master;
> +	const unsigned char nil = 0;
> +	u32 header = DATA_HEADER;
> +	u8 trc_hdr[24];
> +	ssize_t sz;
> +
> +	/*
> +	 * STP framing rules for OST frames:
> +	 *   * the first packet of the OST frame is marked;
> +	 *   * the last packet is a FLAG.

Which in your case is also timestamped.

> +	 */
> +	/* Message layout: HEADER / DATA / TAIL */
> +	/* HEADER */
> +
> +	sz = data->packet(data, m, c, STP_PACKET_DATA, STP_PACKET_MARKED,
> +			  4, (u8 *)&header);

The /* HEADER */ comment applies to the above line, so it should
probably be directly before it.

> +	if (sz <= 0)
> +		return sz;
> +	*(uint16_t *)(trc_hdr) = STM_MAKE_VERSION(0, 3);
> +	*(uint16_t *)(trc_hdr + 2) = STM_HEADER_MAGIC;
> +	*(uint32_t *)(trc_hdr + 4) = raw_smp_processor_id();
> +	*(uint64_t *)(trc_hdr + 8) = sched_clock();

Why sched_clock()? It should, among other things, be called with
interrupts disabled, which is not the case here.

> +	*(uint64_t *)(trc_hdr + 16) = task_tgid_nr(get_current());

Is there a reason why trc_hdr is not a struct?

Thanks,
--
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
