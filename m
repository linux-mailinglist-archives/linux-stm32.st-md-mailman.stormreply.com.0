Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPRhC3u4xmnoNwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Mar 2026 18:03:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C34AB34801F
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Mar 2026 18:03:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89DAAC8F287;
	Fri, 27 Mar 2026 17:03:54 +0000 (UTC)
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19A6EC8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2026 17:03:53 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 22480 invoked from network);
 27 Mar 2026 18:03:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
 t=1774631028; bh=1pNHOOxkrInwAKVW1kychxWbDV24cN7qwurpLcenHAg=;
 h=Subject:To:Cc:From;
 b=CUSlZjbCPiBqxQiLpBHw2huIXCvZEblim9cHHLDW+olL1wSW0EUM03fCaDQlC6vhk
 seIVRHg+yHBBx2eMqOJ6c7+Pch2dzdgrBTC9ocHOIbZKhlSuPDgCnZSZL4NvF+PFi/
 fjvpWRR2REI1HKvnOMYMINOEr+SGCX8kfdpV1qk+pdXpgjXu4Fh61Ucaiag14ywOWD
 Brxok7210QSDFuM/h4YlftujO9V3uT+07kKpAk9bkgp2YlV/C8qMLe/djDe8NJ5r4U
 wL0UqmcrxEIc5BXmYe/rgGZBWanSraSi+HnYQz4f+sI0rajVL1vLDEWZ19OE6UK1xx
 XE4xilcro5gzA==
Received: from 83.5.169.164.ipv4.supernova.orange.pl (HELO [192.168.1.21])
 (olek2@wp.pl@[83.5.169.164]) (envelope-sender <olek2@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
 for <herbert@gondor.apana.org.au>; 27 Mar 2026 18:03:48 +0100
Message-ID: <c2a3dc2e-8d4a-4a59-ac5a-ca22be705488@wp.pl>
Date: Fri, 27 Mar 2026 18:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20260303184916.69132-1-olek2@wp.pl>
 <abToanZh-mkEjmJ-@gondor.apana.org.au>
Content-Language: pl
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <abToanZh-mkEjmJ-@gondor.apana.org.au>
X-WP-MailID: c35bd8ae87df3f160010f467442666b9
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [YFOn]                               
Cc: linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] crypto: testmgr - Add test vectors for
 authenc(hmac(md5), cbc(aes))
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[wp.pl:s=20241105];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[wp.pl : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[olek2@wp.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[wp.pl];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[wp.pl:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olek2@wp.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.967];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wp.pl:email,wp.pl:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: C34AB34801F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Herbert,

On 14/03/2026 05:47, Herbert Xu wrote:
> On Tue, Mar 03, 2026 at 07:48:44PM +0100, Aleksander Jan Bajkowski wrote:
>> Test vectors were generated starting from existing CBC(AES) test vectors
>> (RFC3602, NIST SP800-38A) and adding HMAC(MD5) computed with Python
>> script. Then, the results were double-checked on Mediatek MT7981 (safexcel)
>> and NXP P2020 (talitos). Both platforms pass self-tests.
>>
>> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
>> ---
>> v4:
>> - rename aes-generic -> aes-lib
>> v3:
>> - correct sha384 -> md5 in description
>> v2:
>> - rebase and resolve conflicts
>> ---
>>   crypto/testmgr.c |   7 ++
>>   crypto/testmgr.h | 255 +++++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 262 insertions(+)
> The previous patch has already been applied.  Please redo this
> as an incremental patch.

Checked the crypto tree, and this patch still isn't applied. I've sent 
multiple test vectors, and you're probably referring to a another patch. 
Should I send it again, or will you accept it as is?

By the way, that's the last one. As of now, all my routers have the 
missing vectors added :)

Regards, Aleksander

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
