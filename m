Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ODrHmjRoGlHnAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 00:04:08 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3C01B0B93
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 00:04:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F571C87EC5;
	Thu, 26 Feb 2026 23:04:07 +0000 (UTC)
Received: from mout-b-107.mailbox.org (mout-b-107.mailbox.org [195.10.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71827C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 23:04:06 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-107.mailbox.org (Postfix) with ESMTPS id 4fMRpq6JCKzDryh;
 Fri, 27 Feb 2026 00:04:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
 s=MBO0001; t=1772147043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7v5avoGOleuykikPyFzz717Uwgm0oyh5TKNI4z15XhE=;
 b=o2DpK13tVS01D5w7H1q7+YcyRyDt3lQULFhP/3N/Jqyz6v88rH863uQvftAv/Kyzew+w7i
 XaiFvQxO1EUB+rAfWo5+PsKp/DY5ctsCOHKu4gQnuvQ4A132k+HY9Q3bNaMUQvzvhz4Tfq
 MkFq53mX4CkODLV4OxmGnwqlRx946yUyoNlFd8sb11JWHS4+igW60SHg6S9WKw9VSW774i
 yW5HefTqzlxAJzY9IzUHkGYqDf58drb5T7n1pQSJhIquDilfsSq2tLvdIkhEq8CqowaphZ
 r+51dVZxMcNE7hfdZpIOBqQ3DjRUL93O1aeWHHfyqPynTFBF5EjHPGnVq/oWRw==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of antonio@mandelbit.com designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=antonio@mandelbit.com
Message-ID: <eb249987-55b6-45ff-9cca-3ed198ba84cd@mandelbit.com>
Date: Fri, 27 Feb 2026 00:03:58 +0100
MIME-Version: 1.0
To: Alain Volmat <alain.volmat@foss.st.com>
References: <20260224-spi-stm32-chaining-fix-v1-1-5da7a4851b66@foss.st.com>
 <d14f3943-b97a-4940-95dd-39c6fc240130@mandelbit.com>
 <aaB4z_A4aTqirDGb@gnbcxd0016.gnb.st.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Organization: Mandelbit SRL
In-Reply-To: <aaB4z_A4aTqirDGb@gnbcxd0016.gnb.st.com>
Cc: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix missing pointer
 assignment in case of dma chaining
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[mandelbit.com:s=MBO0001];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[mandelbit.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:clement.legoffic@foss.st.com,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:broonie@kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[antonio@mandelbit.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,vger.kernel.org,kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[mandelbit.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.974];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antonio@mandelbit.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email]
X-Rspamd-Queue-Id: CA3C01B0B93
X-Rspamd-Action: no action

On 26/02/2026 17:46, Alain Volmat wrote:
> Hi,
> 
> On Tue, Feb 24, 2026 at 04:25:14PM +0100, Antonio Quartulli wrote:
>> Hi,
>>
>> On 24/02/2026 16:09, Alain Volmat wrote:
>>> Commit c4f2c05ab029 ("spi: stm32: fix pointer-to-pointer variables usage")
>>> introduced a regression since dma descriptors generated as part of the
>>> stm32_spi_prepare_rx_dma_mdma_chaining function are not well propagated
>>> to the caller function, leading to mdma-dma chaining being no more
>>> functional.
>>>
>>> Fixes: c4f2c05ab029 ("spi: stm32: fix pointer-to-pointer variables usage")
>>> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
>>> ---
>>>    drivers/spi/spi-stm32.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
>>> index b99de8c4cc99..33f211e159ef 100644
>>> --- a/drivers/spi/spi-stm32.c
>>> +++ b/drivers/spi/spi-stm32.c
>>> @@ -1625,6 +1625,9 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
>>>    		return -EINVAL;
>>>    	}
>>> +	*rx_mdma_desc = _mdma_desc;
>>> +	*rx_dma_desc = _dma_desc;
>>> +
>>
>> Thanks for catching this!
>>
>> Indeed my fix lost the pointer-to-pointer logic, which was needed to pass
>> back the computed values.
>>
>> This patch looks good, but at this point I think you can also remove the
>> lines:
>>
>> 	_dma_desc = NULL;
>>
>> in the error paths above? Setting them to NULL makes no sense as they are
>> not going anywhere.
> 
> I agree that those lines can be removed. However my feeling is that this
> is not part of this fix since this is more about removing useless lines.
> If this is ok for you I will propose another patch on top of the current
> one for that purpose and without the Fixes on it.

I agree.

This fix gets my

Acked-by: Antonio Quartulli <antonio@mandelbit.com>

However, I'd let Mark (the maintainer) decide.

Regards,


-- 
Antonio Quartulli

CEO and Co-Founder
Mandelbit Srl
https://www.mandelbit.com

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
