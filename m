Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZO5/NSpsMmrezgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2026 11:43:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FE0698033
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2026 11:43:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b="GX/i+kn6";
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=NxKLD8vZ;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C40DC8F28C;
	Wed, 17 Jun 2026 09:43:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF218C712B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2026 09:43:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65H8ULLf239815
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 17 Jun 2026 09:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Y0PFZ3dXkaCLzVPbD6H+hniaJto+R8rtLevzujc1O/Q=; b=GX/i+kn6Y6I3oDWo
 aKZ3q+/3afC6clikdCrc1fjsFR5e2YYq18MqmjNtGJHnszSyPl6hwpd830Ak7uek
 bi25KgGDgRZSeh+nmw4Obz/Njq1fFljmEQOmJtBNmi8wdgg036Ni/adGyzEsrQxp
 WQq6yOWPI3MIHxn0YKWWwQR/Pu6uVowDZSgkjEgP/SBXKHpagFDFUY/5EhtHygzc
 qcH8nqgKzEOoiboJZJkdYWUW7AQiGGJKa8rIpUKjcOJN7ThxhMMziDXPuAgLtjFq
 3e1oxGiP35MSTBItCrgq7JVVvSNUV1k1lKVvIHRuaU32O2ZK+qVLUx5NInTVqnUC
 uGPRhA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueepjdaq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2026 09:43:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5178ac43d27so14282231cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2026 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781689382; x=1782294182;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y0PFZ3dXkaCLzVPbD6H+hniaJto+R8rtLevzujc1O/Q=;
 b=NxKLD8vZyPO86LUGgcs6s/3nhP+Dn8FFVjNXXCLXFxzoGaE/Y/6hIXwq/BkfVM0h9d
 W0yJojINSZtsL7Lw+CeRYOb/l5bGhhZUxMoNjW+7hAKnopsRC/YbHQjxF+ONPaZ1kjuz
 QNO06tefUAYGbTPdyi6UydmqLW57My+QSdGoYtSgzr/acTn7ptjwlx02xeXy4q9AQn+X
 V1KE4Jb9V2nnq798HXI6UKOK6oenPm17i9BYm+T2kqy91eIL6iv9nG7v2ipBTP17Js8Y
 TvK8O6AGu6kWsS3j84b0/TwdDUeUUpF5yqVpQd8wM3kT+w/jftoajap0zYhqurNkTvkA
 VQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781689382; x=1782294182;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y0PFZ3dXkaCLzVPbD6H+hniaJto+R8rtLevzujc1O/Q=;
 b=J2iclgLxGY9F4fBuh3QV2v5Oun+/3BIKsOXW3wdq8qboI5xzclsTEuw91G3CiQ4QnO
 Z0DZ0VcpmsGyY6cJuTZKsbcdprG30BV33na1qIVOEb1Wkc1ONk7wzRsbImk7jekMpf2Y
 0Dcf6VKiRJZ880oNK+OWVOyD8hWMyVd55Vwr/Be5GERmhqsMQsYKl2VktFPvXj//15Kp
 FZpUY7hlb3aw7rep3INWFulMTtJhvuBpWebT7La/duksRPG6ixZRtIOE4+SYSyximcpy
 jIG4+izlrtMvfgfYSQEXD7iMoatcauKKqi0M8W7Ya6C2wIUITJvdeBm2nBqVd+T9GVDA
 0YSw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8llqs88wKFLSbg5nU0X+QKoip0S0aOItFYEQ1G4+JQFx/X4eoEMkBmAH2jB1kHO+WOcpM1llrNNlMrIg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyBO1ki7heVQhoHl4wEvo8GamBADCclYMfmk+ZycTLr57wj9zMS
 old+VmVhY+cJ1bGcTDxOiyakj+Uv5bPTYKmAFhFPYaGB7JrLYjm3CkLQo6RCpSjktiRX0GKJLl1
 TjrtO0rYSioS7IQePfClkMCE5RU446txnlnnnKJfv3IgyNERRbPMCk90VPzeWjtaK0gmCjPYBeQ
 BF7hcmSrs=
X-Gm-Gg: Acq92OHL3XwE9ve/Roy5foLYvb/dJ2fC5rqTg65m0xUpdSFlXr8T+0VejYCpoRLpwPI
 HvEoNoWP9ZQ43JZmXIKf+rFQkrgznwRaF+Bbq/U+onRBwgSyA9fqudj0QDMkLtVmtgUYLUWZF3t
 a/Z898SKAkNmgC+IjET6pL6QmSjnfJmk9SVZrC348xgb4RIUyjBfAVLWJvmZ1xBmX43IVAKwQcj
 jMIiaZGqpmFGhj9PwazIVZsqRQswsAldxRzpSg5PmrSogjc0xik2oCqxRFMkTl4i7s+8qwa/53R
 UT+CMMZd+vEO1rIqlYNvFK5bs7855jr9+yf2fBOVdY29Sm3drMmADhngCsEIPQ/Hw8pd4BixOGz
 B0VCFxDhSVrjR952Mc4QYSkkKoC+rpgk1ZQc=
X-Received: by 2002:a05:620a:1727:b0:915:6433:2599 with SMTP id
 af79cd13be357-91db94877e5mr256355485a.1.1781689382014; 
 Wed, 17 Jun 2026 02:43:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:915:6433:2599 with SMTP id
 af79cd13be357-91db94877e5mr256350885a.1.1781689381048; 
 Wed, 17 Jun 2026 02:43:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6937919b458sm6374523a12.5.2026.06.17.02.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 02:43:00 -0700 (PDT)
Message-ID: <4f3c6bee-3ccb-467e-a466-89fece0e6a7f@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 11:42:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
 <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
 <ajF+xlipLuZtf4HL@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajF+xlipLuZtf4HL@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AY+B2XXG c=1 sm=1 tr=0 ts=6a326c26 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=zlF0UblE2nBlcRgU2acA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 9V3VtqeQsMu8Zwm8quMfabnEBWB2Vi1e
X-Proofpoint-ORIG-GUID: 9V3VtqeQsMu8Zwm8quMfabnEBWB2Vi1e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5MSBTYWx0ZWRfXxAz2uVbjT+ll
 J3DHK8N/bpfd3pTi/1wH50AS7Dz7k9zqknp55K8Ji+UChRVJDwBWVcXD55V8DsfCjkrjaPbHsZJ
 JH1cq3cxPP6cQxBquazVPXW0QzASRZZjZ+bPSM+qeLHAWmx9EaYGEhw7On8uYZNc9Q5eTXvnQWX
 Ee4Zk6Pn4Tmc06BtSeaECwCPWZiJcWoh3BqGKteViiUdJcLr3/zaCLBZ2TOuhj116JoHKhoeAq1
 itaVdKvIKhe+xKLOci3DWaUIGCEk553N5YYpHybdd2Tn1F0NHsFv3mEQPWhZAmHJRDn3Qv09Eyh
 LK8mOnKQkcuwka6ag4JtOigpAEozJ8PwdS8yMuUy8blnbFXxHXwzYgTsQegbysRqwAWHFl6lEmS
 WLj7OoZicsbim7UHvcj08v8hqQvrfL6L7FfXWl7iP2lsHJZaNzGzfGaSU+PJJTP4yYVahJR5x/T
 eVc17ejVt2xikqX3IEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5MSBTYWx0ZWRfX68LaYp8/YLJA
 KJbIdJl9aFU6QBrOdXikOKvGmEXffF2VLrL2UwrkHol/nN+ng3HffM9ySws2J+EVknue+q2faeI
 TsD/u0zQevYEDkiCa6enSEQ0/pyF8sw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170091
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk:
 Enable ethernet0
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,armlinux.org.uk,lunn.ch,google.com,lists.infradead.org,redhat.com,davemloft.net];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:davem@davemloft.net,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71FE0698033

On 6/16/26 6:50 PM, Mohd Ayaan Anwar wrote:
> On Tue, Jun 16, 2026 at 11:50:26AM +0200, Konrad Dybcio wrote:
>> On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
>>
>>> +&tlmm {
>>> +	ethernet0_defaults: ethernet0-defaults-state {
>>
>> s/defaults/default
>>
>> Please move this definition to shikra.dtsi
>>
> 
> The CQM and CQS variants have identical GPIO mapping but the IQS is
> different. So should I keep this in shikra.dtsi and overwrite for IQS in
> shikra-iqs-evk.dts?
> 
> 
>>> +
>>> +	emac0_phy_en_hog: emac0-phy-en-hog {
>>> +		gpio-hog;
>>> +		gpios = <149 GPIO_ACTIVE_HIGH>;
>>> +		output-high;
>>> +		line-name = "emac0-phy-en";
>>> +	};
>>
>> This looks like a hack - what does this pin actually do?
>>
> 
> The power supply to both PHYs on Shikra is gated by a GPIO pin. I am
> unsure whether they should be modelled as a fixed, enable-on-boot
> regulator or just like this. They need to be powered on early so that
> MDIO can detect them.

If it's a regulator, then it should be described as a regulator. There
was some discussion regarding the power resources of PHYs over here:

https://lore.kernel.org/linux-arm-msm/SN7PR19MB67369F7DD02F702437C0F1919D1B2@SN7PR19MB6736.namprd19.prod.outlook.com/

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
