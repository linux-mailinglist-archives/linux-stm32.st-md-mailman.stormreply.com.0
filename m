Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDeqNkSpe2m8HgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 19:39:00 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80111B3A4E
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 19:39:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16140C01FBF;
	Thu, 29 Jan 2026 18:39:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66D40C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 18:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=yZm7KO5pw9/R6i1YoD9nUCzfryvpA/gVSTAcmV7o7jY=; b=yW2gX0WGPYwXSQBveO5NIwlLMW
 nN2w7zkgq+zWEn6MgNKPDk6yMrZlyZtyKt04z3eWnHTXVu9/V+rp0dYxgxu/n+1o+2Vs39s1oxn+A
 npA/2DOS0bnqsilWSRwD0cQdf1h65e8VAKw+oVmLAyO/I28zp0ogSe+l7cBbo4AqHZYAtG7QrCZSc
 EFfOQ9G/RZNN/cUuD0uIeGTg+BIJ+khBmsLROnZPKurM1eNpKRsHfmoEbWtMBI8XRnAySo7WYznZw
 8pTd4EW8M2HEuQwDgD/qM+yVBx3hXMqr3pMdtvl+2cK6mCzMWasAcqHBZnsP+r2cgfXsy2qumlOv+
 7yXzfiMg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vlWup-00000000WYl-1efr; Thu, 29 Jan 2026 18:38:51 +0000
Message-ID: <9ed4124e-a6f4-4994-a80e-860a1123c8ba@infradead.org>
Date: Thu, 29 Jan 2026 10:38:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260129-p_ost-v5-1-2b14fff39428@oss.qualcomm.com>
 <0ed08d07-5736-4874-9a0f-0f848e8419b6@infradead.org>
Content-Language: en-US
In-Reply-To: <0ed08d07-5736-4874-9a0f-0f848e8419b6@infradead.org>
Cc: linux-doc@vger.kernel.org, quic_yingdeng@quicinc.com,
 linux-kernel@vger.kernel.org, Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5] stm: class: Add MIPI OST protocol
	support
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,goodmis.org,kernel.org,efficios.com,lwn.net,linux.intel.com,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:yingchao.deng@oss.qualcomm.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:alexander.shishkin@linux.intel.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-doc@vger.kernel.org,m:quic_yingdeng@quicinc.com,m:linux-kernel@vger.kernel.org,m:yuanfang.zhang@oss.qualcomm.com,m:jinlong.mao@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-trace-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,infradead.org:mid,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 80111B3A4E
X-Rspamd-Action: no action



On 1/29/26 10:31 AM, Randy Dunlap wrote:
> diff --git a/Documentation/trace/p_ost.rst b/Documentation/trace/p_ost.rst
> new file mode 100644
> index 000000000000..df93b889eb4c
> --- /dev/null
> +++ b/Documentation/trace/p_ost.rst
> @@ -0,0 +1,36 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===================
> +MIPI OST over STP
> +===================
> +
> +The OST(Open System Trace) driver is used with STM class devices to

   The OST (Open System Trace) driver

> +generate standardized trace stream. Trace sources can be identified
> +by different entity ids.
> +
> +CONFIG_STM_PROTO_OST is for p_ost driver enablement. Once this config
> +is enabled, you can select the p_ost protocol by command below:
> +
> +# mkdir /sys/kernel/config/stp-policy/stm0:p_ost.policy
> +
> +The policy name format is extended like this:
> +    <device_name>:<protocol_name>.<policy_name>
> +
> +With coresight-stm device, it will be look like "stm0:p_ost.policy".

   With {a | the} coresight-stm device,

> +
> +With MIPI OST protocol driver, the attributes for each protocol node is:

   With the MIPI OST protocol driver,                                   are:

> +# mkdir /sys/kernel/config/stp-policy/stm0:p_ost.policy/default
> +# ls /sys/kernel/config/stp-policy/stm0:p_ost.policy/default
> +channels  entity    masters
> +
> +The entity here is the set the entity that p_ost supports. Currently

                   is the set of {entities | features} that p_ost supports. Currently

> +p_ost supports ftrace, console and diag entity.

                                           entities.

> +
> +Set entity:
> +# echo 'ftrace' > /sys/kernel/config/stp-policy/stm0:p_ost.policy/default/entity
> +
> +Get available and currently selected (shown in square brackets) entity that p_ost supports:
> +# cat /sys/kernel/config/stp-policy/stm0:p_ost.policy/default/entity
> +[ftrace] console diag
> +
> +See Documentation/ABI/testing/configfs-stp-policy-p_ost for more details.


-- 
~Randy

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
