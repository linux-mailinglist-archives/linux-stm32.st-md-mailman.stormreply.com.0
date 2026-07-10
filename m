Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fRbqGU6nUGq/2wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 10:03:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A905E7383FD
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 10:03:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b="XjrkTx//";
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=ibPImcmV;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67A44C8F284;
	Fri, 10 Jul 2026 08:03:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACE3AC14542
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 08:03:22 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66A7dqSw188249
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 10 Jul 2026 08:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ap9hHDubMVCMsfg7cGTWsN/PZnCJfGCkkJHZ64FkGVU=; b=XjrkTx//8jIWJS9y
 lM+/LQmLTmT3ouZ77LSTFFa8Fvcvfhj0GCwVIKEHyp+BDzVaVe++gqcHd1f9aiOq
 RlRRCc8kvZ4DEJSTGT6PGSj6fcZAEv7Wb4llLhpBJDpg4/ewoT2w3IXgMK8axCsw
 vDey1eK+YMU14awAgdJ6jY5tcBGrdrfok9mxjMcq61tSsdtBaZ4tbF2aegj+L0re
 ldCS3qoJJFcPVHOmLgbP+WwPtP6zbnCh0+0x0dCc8nJqZtVrt2DJuB1QNF9k5X54
 Ijp0XVGVwVQ7OY3Nz8O0qO74db6+wuZbLWbcMC1nJmQJbLGtOi6TYYGrvrZ2wKYS
 z3nmiQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesuead-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 08:03:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c894c1c4aa9so1018112a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 01:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783670600; x=1784275400;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ap9hHDubMVCMsfg7cGTWsN/PZnCJfGCkkJHZ64FkGVU=;
 b=ibPImcmV8xasZscLNrJ6VglYrP+SIzRZ19EYkMEanQH/u9FhO1nLQiH/txaWcxYhYk
 o9Ifob0vciOXroMDfxBUSjmZ7WIfGMw2AryKluvBm7oXmJ/Kmq63IhAiK2F6D7u1Gsue
 72nacAEo7vgvuosSEjPGmv/Dizv8ZncuFj2R9jjlchcW1rNSYqu4jYKmrwIS9B67102E
 DPAaco9GXOfi9m2tyfOL0L/9yL12ueIDXTRIGkJwK8uy0ktXzHRfWkRDWUdVUl9mQEWx
 Z4ZXbRtwvTm2ZPSXXv2MegaogGUzavhuvu0DAwOAxDIK4x/+X6sTF1F61WJG0ZNzy7hv
 Wt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783670600; x=1784275400;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ap9hHDubMVCMsfg7cGTWsN/PZnCJfGCkkJHZ64FkGVU=;
 b=Chefn15DAHp3gVjjQkr0REYizuEHwgLc5munrC86vbqouDLxip8HR6Hp3NFQUdI0KD
 YxmYcVGG5fSEJioQW1QRj2AL7U3sT+J8AQc54UJZY8r/9thwgr23CQT8d/X9SCfIJJKm
 MdPcEB37q4YQo0g6d41u0pDKZYSTr47pBNXIjLmWdVGRTWOsbu7K5Y7uUYxYMop1EYXN
 472+Mm/1/bcDGES1KLguvF8XqIa2Jk5WBTMrDedA0hzHTdkewAHq7KNyT3GN9p6ktcZZ
 RPIIKZ74glQWcDzR/lal87j2UCGguzZkf9T9BqJxEcP8c7Pyq6Ksznen+Xa4jQk8ajmy
 28RA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoixwHLIm4NM+nskA5kh9j6JqVV69GZ+dDnqHEdePRG7eR6bUHGcn1AjxQrzgGxukudr11Qzunfbxv6xw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2JMeZdpQvQsQtx9wISHJDpLTRFm/SDRRmHHR0oQcCQqM0cahM
 7r0gbZk/vCccUC4d87gddeWi3OY5I23YO1V1eTsLneTUHD42G+HYnfmo/EXA4/ULsLdE/LjRVTn
 YTje1a9/bMztbQMBIJgYMvSHkVm/V4L8iwuZa0ZQvbZF8EKfF0yFBOWeDbnAqvLTBsooO76PdfY
 swC5fyFso=
X-Gm-Gg: AfdE7cm34Syj/aaZO34bgq+Jv1bSNNWwzR4a92aYEO+wM4HBRNf+pO+Q/T0HMM3gt51
 DvK3Nq8RoToeVZ7N1eIBSYDjapzgV4Wfpb/u5fpUuH5YCwizIV+F5YlxDw1n7yP4uY7gIRfnlqX
 tBdt3cp/GY5/bZD27HsprMCYEo/+agcYKDx/IcGyOr+iaLH5Rk5Rfgx1L2IZ1EMBax2KHv/hQ3P
 +9Tpad1m/dWGpmpWPw26bRFB1rm6bCF6lET3a7XjyYefL0CePq3ZgzxKxlX3NjHPQmupiy9zceX
 EcoAkpMzwfC52Sw7DEVEgg/kobHrkuX+QAsTFZ4Pg0uq6BMNyFw984bVMYR+N9xJ5eCIcUEbaDY
 4UD42bO7iPE/4EP4I4w4ofaj6Iwzk1fDngCD+2fVqkwuxmJAPdUKCmx4AdOXVpVSTc+lD1xZAkL
 gB
X-Received: by 2002:a05:6a20:3d94:b0:39b:ba95:b14c with SMTP id
 adf61e73a8af0-3c0bceccfabmr12625910637.24.1783670600513; 
 Fri, 10 Jul 2026 01:03:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d94:b0:39b:ba95:b14c with SMTP id
 adf61e73a8af0-3c0bceccfabmr12625864637.24.1783670600014; 
 Fri, 10 Jul 2026 01:03:20 -0700 (PDT)
Received: from [10.133.33.242] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b3643ecdsm4926620a12.24.2026.07.10.01.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 01:03:18 -0700 (PDT)
Message-ID: <3f8a74b0-1f0b-41de-af64-03cb6e983a04@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 16:03:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Yan <leo.yan@arm.com>
References: <20260702-fix-clock-refcount-unbalance-v2-0-2383fbb9952e@oss.qualcomm.com>
 <20260702-fix-clock-refcount-unbalance-v2-1-2383fbb9952e@oss.qualcomm.com>
 <20260709152410.GE1024232@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260709152410.GE1024232@e132581.arm.com>
X-Proofpoint-GUID: TlP9MqwoSY0ZgMxiy3KXYUSeHdt6rTk3
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a50a749 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=d1ZDJawjCgYNIZ84EkIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA3NyBTYWx0ZWRfX/Yhx0x++Ew11
 sCZzL2xUfWimYdgmXaDDsQAPakzAxq6aRIzfneP5jZFSQqX2JbSBafmPcijGiQQVCJbOF0+EDKo
 xkgRQeXMCC/w4o7YHVe98XxnoUOs/gg=
X-Proofpoint-ORIG-GUID: TlP9MqwoSY0ZgMxiy3KXYUSeHdt6rTk3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA3NyBTYWx0ZWRfX/YamLsFQo+AD
 6tHu0ZYf2BsyMxhFVKJMtcGP36sw158Snobzi+6tPk1i7h9PniqvjxzlKFQH7xoldwJdGdYNaiQ
 Bc4dh0EquXAs7uTfD1CX5cv8WorFGnDtKNSc7y75cCebN2Q2wTPT/y4CXq7KijhktzU/KBiFyFd
 pJBBZBh2vz4lQpZk4VJpoCdc+fvpAYS7nthQGOYJeYteRsV2fFJOwXCNOuHLDhneuPoC0Bvfipi
 /HPwDnmunBTCAnHhSVI+5r+UANuuwEbw1yeuuXnqKuVtLwZ7ty8P9gB4bdb2Vkyx2EO6iNI4KaD
 Y1Lsz+27bc0VoRR85PCchn9gmjz+z3/wQNvfkkJ3gjyl/flpL+t43tmtuRDVf8dOoNd1afiSbVd
 HVcxwoZiUQgNFwrtwS8///zpIUGCUBFRKxc9GO8Ln5bd42oxYzxh0itfqw2fPRezn91lg7kMKZ+
 jc9/Cn4tPhmfRbkKmtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100077
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mike Leach <mike.leach@arm.com>, coresight@lists.linaro.org,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] coresight: Fix clock refcount
 imbalance on platform remove
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,arm.com,linux.intel.com,vger.kernel.org,linaro.org,st-md-mailman.stormreply.com,oss.qualcomm.com,lists.linaro.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:leo.yan@arm.com,m:mcoquelin.stm32@gmail.com,m:anshuman.khandual@arm.com,m:alexander.shishkin@linux.intel.com,m:linux-kernel@vger.kernel.org,m:james.clark@linaro.org,m:suzuki.poulose@arm.com,m:linux-stm32@st-md-mailman.stormreply.com,m:yuanfang.zhang@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:mike.leach@arm.com,m:coresight@lists.linaro.org,m:yeoreum.yun@arm.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A905E7383FD



On 7/9/2026 11:24 PM, Leo Yan wrote:
> On Thu, Jul 02, 2026 at 04:54:19PM +0800, Jie Gan wrote:
> 
> [...]
> 
>>   static void etm4_remove_platform_dev(struct platform_device *pdev)
>>   {
>>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
>>   
>>   	if (drvdata)
>>   		etm4_remove_dev(drvdata);
> 
> I understood this is not an issue caused by this patch, could you refine
> a bit as blow so can be consistent:
> 
>          if (WARN_ON(!drvdata))
>              return;
> 
>> +	/*
>> +	 * Resume the device so its clocks are enabled again, balancing the
>> +	 * clk_disable_unprepare() that devm runs when the driver detaches.
>> +	 * Then mark it suspended and drop the usage count taken here.
>> +	 */
>> +	pm_runtime_get_sync(&pdev->dev);
> 
>          etm4_remove_dev(drvdata);
> 
>>   	pm_runtime_disable(&pdev->dev);
>> +	pm_runtime_set_suspended(&pdev->dev);
>> +	pm_runtime_put_noidle(&pdev->dev);
>>   }
> 
> With above change:

Fixed and sent new version.

Thanks,
Jie

> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
