Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A48D7275008
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 06:39:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D6A1C3FAD5;
	Wed, 23 Sep 2020 04:39:31 +0000 (UTC)
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B12CC32EB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 04:39:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600835969; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=62upVWs2yXzGE3gWPGzEaiN42HD4HHF9FHmkRd8LCPQ=;
 b=VtR3SctSRSL8CsWHp/3QglorohZzjD2xtZ+K/iwWOxUf51gLKAJp7SlU6UTCDl/aR1tjyCka
 0nJaUyNJX2UfCUsZSyUNf+mbtgcYyd36PzB46pMAvgDQtH1ZLoAo60Da6l4dZ48An9yG9jRH
 nmRO8uSiB1VsWmHSQBhMxpmzbzk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1Njk0YyIsICJsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f6ad177d8a57df5abdf7876 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Sep 2020 04:39:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 01C91C433FF; Wed, 23 Sep 2020 04:39:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tingwei)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 64634C433CA;
 Wed, 23 Sep 2020 04:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 64634C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=tingweiz@codeaurora.org
Date: Wed, 23 Sep 2020 12:39:07 +0800
From: Tingwei Zhang <tingweiz@codeaurora.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Message-ID: <20200923043907.GA5146@codeaurora.org>
References: <20200903001706.28147-1-tingwei@codeaurora.org>
 <20200903001706.28147-7-tingwei@codeaurora.org>
 <87zh5nw8vz.fsf@ashishki-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zh5nw8vz.fsf@ashishki-desk.ger.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: tsoni@codeaurora.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mao Jinlong <jinlmao@codeaurora.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 6/6] stm class: ftrace: use different
 channel accroding to CPU
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

On Fri, Sep 18, 2020 at 08:45:52PM +0800, Alexander Shishkin wrote:
> Tingwei Zhang <tingwei@codeaurora.org> writes:
> 
> > @@ -63,6 +65,7 @@ static int __init stm_ftrace_init(void)
> >  {
> >  	int ret;
> >  
> > +	stm_ftrace.data.nr_chans = num_possible_cpus();
> 
> Not a problem with this patch necesarily, but this made me realize that
> .nr_chans may be larger than:
> 
>  (1) what the policy permits,
>  (2) what the stm device can handle.
> 
> While (1) the user can fix in the policy, they won't be able to fix (2),
> in which case they won't be able to use stm_ftrace at all. I'm thinking
> if a link-time callback would be good enough.
>

Hi Alex,

I'm not sure if I understand this correct. If the nr_chans requested by
stm_ftrace is larger than policy permits or stm device can handle,
stm_assign_first_policy() returns with error so stm_source_link_add()
will fail. User would notice that when link happens.  There's not much
we can do if resource is not enough.
 
> Another thing is that .nr_chans needs to be a power of 2 at the moment.
> 
I'll change to below.
stm_ftrace.data.nr_chans = roundup_pow_of_two(num_possible_cpus());
> Regards,
> --
> Alex
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
