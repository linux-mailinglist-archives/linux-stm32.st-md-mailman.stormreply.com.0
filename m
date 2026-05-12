Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEbkFtnqAmpKygEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 10:54:49 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CCD51D16E
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 10:54:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C826C87EC1;
	Tue, 12 May 2026 08:54:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8E69C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 08:54:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64C5DoTS2202417
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 12 May 2026 08:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=; b=cSd8d3XWV6tPTnyY
 qeTlceQh9goZb/iweKamnT/yd5ZL0n3jZjYDEVbDg+Bqisdqp6/ktzd4zptsR7WX
 qMkF9ozCfzf/cb4QZtOOHkdiF8dF8R16kkALmwlc3e619hoHn+5qDFGWKx9vUKMN
 urEVDYVttdIUygxhT8Upp6DnvBFUNSBQSJfzSq4zKBzLpuXfOjLSMp2LZUAD6n/j
 D4FiygpORscdB312IbtEv6E/WC5HfsUPsDDmczybY45dHabjruXH0BLdx+6PV4BF
 MqLovMg3JFYnIqemGD6vZRNthdf8/LrXQWPxY6IIxrBgUSMeuWRN3t9BmOfRvEBe
 vs8DRQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyjacm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 08:54:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-82f756ebd0dso3402846b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778576085; x=1779180885;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=;
 b=UPWNqVUsvgFFRivL4yU/vrZdzLK4LFBE6AroBhT7l2G9HEpxKIBosI4lQBtYxlWXSL
 fGPZoKkqQaVjj4vUUZ+3vJ2mmskCi1UyRzNG/A17GdKfVPlyrY9JGExp9ILJ8TJQQb4W
 g2irW35MoXLuZugd/EatR9WpSFMeVmYj2tnM97F4vbDlFJIfOhKmLHVsfXxyBVgk/gfl
 48+Vtz3giSadTdx//5aF7L1voi+fj0ifOBMgeMP5tywdhshya6Tpohz5VOjb4AR+tOH+
 HtfaYemonzU3bJ8UZ8o5zeqlLgIL8sUQzlPUeykM7QC0kW5K7yeV17I+7YPr6Cbp/KdV
 rb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778576085; x=1779180885;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=;
 b=dNLbhXpLbt84I4nv2lkZQzjjBeStza/Tn9MPaJzZ6C1kn5jhMy/3rwzZsYCokrwn6W
 OEpjjMmPFKKHcx1aZjNwk4v6+r0QDMmx7l53vP4pIKLEVJpkkqPUHfTcR7enm6t0fF8U
 Wy0enRWe5XBtzjMdcOIYK+QPB73/fk30LKRmN0UjLYkdz+vKYN4s91sm1a5sIHQc6GJA
 4XUQVV0QXe0B+R7+QnJiwf0/o7clXXyyd7HCRcgmDcDAE2E7HVHBpkLXcTaKthAjvEPR
 i1boBn0VvIPYxhYUj+fQnRo6haqMNc/JB5MC1nUguu34zOkC7Zt+QD+GhjyzlUs/bedy
 Rc3w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8DEFpnto43udWJG2T1AiHUrEv06O+GqgwSWpBttJoX/FqxP7pwImCpJAiJLdis2GPg3CNZyx119rKgQA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxK2ozFd0ltoRCH1ymaOYSVIWjCn9JKdUpfSd6H0p8qVX9JinVc
 hvdiYBxl79c66mofh4Kk+lkHe5STSiHJcZQfd3kV7leybQGUWK0gtxrquBR8eWqCr0lmwPmPOP9
 y6+4sQfeDsetP7nqRAffRZv5MuTe7vuqyfoNm1ThogWajjSIDn6iQ78CfbQavrUQXYD4AuugjiF
 d03M/ApTA=
X-Gm-Gg: Acq92OEYtbjgUbPUOg2iy6TvSRdhA86Dp7t3Lo8UIrNti+E3OpM9uhdTspjALvdGJ8M
 OqwKObG06fUG9fHW6nIXMiSe0IOXDg5CIplIRWmROet0xndCgXIEAQr5e28l/6ifK9Iz2BaL3ZA
 +II0fZtAn2ZTQBsse7F0LFA9IvWdyQ6s0Wcj/1wq1Tgervy1DJgltr1Z7zffUujYnlTx41E1wBW
 YvskA40yQ1KWi7cZbcCysLN+KEkub3t1JIC6waOXBHmxNzQs4zRqDl/p7kFtD9c1081DJW5EyMj
 fo6PJJxF7mf/J4Z9Oy6FQK3SXQN39c8vgzsK5v7ZMTJ+uTPLuD3TDqHjK5sp5f37cw0ON4gNzRa
 4eg88/0HpzcnYNeeJjvX6IVv/gJ628uVDRH31ZglEh/BPP5vn
X-Received: by 2002:a05:6a00:4398:b0:82f:5a77:10e8 with SMTP id
 d2e1a72fcca58-83cf5848df4mr17235948b3a.20.1778576085453; 
 Tue, 12 May 2026 01:54:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4398:b0:82f:5a77:10e8 with SMTP id
 d2e1a72fcca58-83cf5848df4mr17235900b3a.20.1778576084924; 
 Tue, 12 May 2026 01:54:44 -0700 (PDT)
Received: from [10.217.217.99] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8396563f03bsm23389781b3a.9.2026.05.12.01.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 01:54:44 -0700 (PDT)
Message-ID: <f17c3e4b-b0e4-46f1-90aa-99751cbc9348@oss.qualcomm.com>
Date: Tue, 12 May 2026 14:24:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-3-bc0c6dd77bc5@oss.qualcomm.com>
 <20260410-hasty-pony-of-tempering-4f0a47@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260410-hasty-pony-of-tempering-4f0a47@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4OSBTYWx0ZWRfXzutXKFDGY/BB
 cVhKQpv2RYZOkoaIfS1u0dSwVqyWcsTlr5M1K9PW5vCm2D1EhEn+PFJ4u0K5zD2ME/h+9Z/pBa0
 P/ieGrwnPLaIscAZ+ovBZGbDZ3DatcfIN6SucANa6H0JL551MXRku7/o3kYTPxgaqgbanmMvQjl
 wHhw3ivhC7lVvKLhy5SVh70QJ4VEu6LJrPiU18om22TUv2V0XLdyJzzgCBV/4QC0jFDFvD+WCff
 NMhX+zqm1JonlToFHnqOzmqxkgTPsu70YKfeh9Smb0G5LTqpJVrmBmFodYUFtsNfONlEaJJnF0o
 medrWvKFooIsT0xxYIOmYShKXuljxtY5zcPZ3xC16lpKSGy/5uPWGCtzJCkjMiGahApviyrCsIn
 MoIBIxkSf7XZuHkmgJghjLcd7bF9YBlE14G0kfhjgUNJpJOLP+Psp8J/PvW/oi3FP+sLFLWWsic
 ShglO/+5AeHYZmWjrrw==
X-Proofpoint-GUID: miP-xu5p6sqh5T6wIgYLFr9bPlC7RbMc
X-Proofpoint-ORIG-GUID: miP-xu5p6sqh5T6wIgYLFr9bPlC7RbMc
X-Authority-Analysis: v=2.4 cv=Y5XIdBeN c=1 sm=1 tr=0 ts=6a02ead6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=2Qn1I_tgzRFu8vZVKDwA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120089
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 3/8] dt-bindings: clock: qcom: Add
 support for CAMCC for Eliza
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
X-Rspamd-Queue-Id: E0CCD51D16E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,gmail.com,baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:imran.shaik@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-clk@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:konradybcio@kernel.org,m:mturquette@baylibre.com,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.605];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action



On 4/10/2026 1:17 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 09, 2026 at 11:40:44PM +0530, Taniya Das wrote:
>> Update the compatible and the bindings for CAMCC support on Eliza SoC.
> 
> I do not see any update here. Also, no improvements after v1 comments.

Sorry for missing that update the reason for Eliza not compatible with
Pakala. I will update the commit in the next patch.

-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
