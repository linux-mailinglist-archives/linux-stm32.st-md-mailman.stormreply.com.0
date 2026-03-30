Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KCDGilcymn27gUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 13:19:05 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A2E35A19A
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 13:19:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78232C8F260;
	Mon, 30 Mar 2026 11:19:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9552C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2026 11:19:03 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62UBEGg41402790
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 30 Mar 2026 11:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nyQfzMVY5tU8yDNVE7v1bNOl2YyateXWELi7HVSLmwo=; b=M5vrsa+3fUMTvHpN
 R4r8YAG5do0rd6uVgMpdxA3GUV/CpHibqfk3AxRUTQ6xYqdRzuWmxWDRBRn5s6Kq
 qPE9z/wO3StzK3mq5IR+h8ybPjOA9T7b5Tn7XUeyd1IguIr9bj+IdSqegEvacKB3
 TkLB0kTRZmFQszEF3+GtbufyGIzDvvAVePhkPJTYpwhuYzCsHfhi4K7iUmHGGpF2
 VUknKt9x/iIe/SEI4VLcpwPJfnt5vLKEIQ5nEpFaeVGbp73MMAmTrzNyRYFB+i0o
 4qd9slaq0ECgvfg4772fmPAhIDbq+bIzV4T3nSs/POsB6C3ANB502S4go+ByEQL+
 cE1/qQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4h80mb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2026 11:19:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8d1a5661ff1so11531785a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2026 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1774869542; x=1775474342;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nyQfzMVY5tU8yDNVE7v1bNOl2YyateXWELi7HVSLmwo=;
 b=OW8STNBQwDQqUUwfzBSBlW9Jyk3EfFFgnCNRlyfQ44G/9Bx1sSLaVZqw9InOgoOvW0
 R3huTEI1DlohadbFVHwwQHTIniHVkQOttzDT3WtiUZ/T9Bb/TfS6D1TkYAlMnbDU1VlF
 YLCqT4mMOYV1CWzMyPBk7567GGeT/GwxE2VIVh9NtpxbcIPlb1y07KGE+BHzKM5Z0G5/
 83rczwjveLpc9Ai8/ngVyXnYQ156MSlliX/i1kJz8Cm1oDXkrgNffWtbz1gSVWirx/LI
 Ud9LLWzkxoTz5ZSoaYwRxJjmB9V4XqugA+WjHAz+ojbQ78fE4b2QPMFZqjjy40m0BkWS
 lvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774869542; x=1775474342;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nyQfzMVY5tU8yDNVE7v1bNOl2YyateXWELi7HVSLmwo=;
 b=KlVToifFXI6b+s5zsGyWxjGW0W/Ad0/Zu5fhVqBNsmLqOzr30n0MEn+6cqxaqAUFXu
 ++RintQn+cND4nTr63QEoLDEDXN57rHx/G4j3IA45SLepb9UpPjZZV+kel08kEtvWw9w
 ja1wqz2u1jszmeHBJ27G8w7LmNvGqnhuJDB91g2k8ceE1KCY42XIwcrzlEdyz0OCwKjL
 /RcdFT4M3SONir7Ziuqub1bG2VYg0fQFhMjfvVGGLPk2yoe35omA1ou9GVzDIjMi/jxy
 sOmqKOPBkyJLytSJUvtZD0uX5NhA++kK3nd1ZyZgOcRbl31/qat0lDpAOjp3CJqtUmvD
 gngQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwysLOggnnAZQOX5DvQ/AQ8WYt1DJwhHIIZY1AbnuAXzEl6XYdntfcLrubHVvfWQT8d4HrzJf/3LCAnA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxq1sxMoxt16oJkw9iSCz8ZopITxyKkueeCqh3IuwYti4JzW0vf
 kQKWwshqsJsiY8yw3M1pKBdWy8cIZRDznKgokj4EDpYq07Z35rqZOAa6LJRGldjygtjAdSaTjBB
 iDBPItzXADMObI7mN4ucqXcM74O7WH6Bq2wUVG3P4dIZ0Xi3QXj+5Y5csrVN5SL/VYz62W28oqa
 KomO0B4wY=
X-Gm-Gg: ATEYQzxCE0LZx74X69+nmodUFpy72UlVpJfc2igv3wOjOZLozD9yCPTpk+0ILrBl6Li
 GJewQyRMAX6rIyDXYmI33ouYIxvh7wl7Cvvr2IQADpXBr4MEwmkjnudAbFOXr0Sg3zdMWCTrUaY
 v1PUl5JchPvs94BNY/zBQoHCs2NdjFfQ5Ab48ArN0LlVwOB105vuQvK9OkEurvYBzH38LQlIc8B
 0b+HlutTEAMmZ/Gy/OS5ExyN1vkbK16FRln6m/Czx7r+hsu6UFAqAxkA+sE8vXAEbIJ58H8/JDR
 blzM5y5VsJ8Sg5RI5/mF4X4hRkvTrWw9sg8tyNtd7clycgQ596uGNnfB4RJ08m5Awrb7IobfDxj
 vDgY3Iw7Ho5czBisRW4moMexZWo5JQVWEpcdXDBXP/XzBHJA49tPATkDXgzOFJRSpcDoT4B2sOJ
 T9ESo=
X-Received: by 2002:a05:620a:2a12:b0:8cd:8bfb:a4a with SMTP id
 af79cd13be357-8d01c322c10mr1083812385a.0.1774869541624; 
 Mon, 30 Mar 2026 04:19:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:8cd:8bfb:a4a with SMTP id
 af79cd13be357-8d01c322c10mr1083808485a.0.1774869540995; 
 Mon, 30 Mar 2026 04:19:00 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-66b72a6ec5csm2366019a12.9.2026.03.30.04.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 04:18:59 -0700 (PDT)
Message-ID: <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OCBTYWx0ZWRfX6oDCWrXX8HUP
 HxnPiyoGcG33dqvnSoYGRHDeqBnf+gD06KC99Ed+OmMxEpYzPCq2YNI8O7QYyPChzBif55+LieY
 /fgzul4fWEz+dwSCvdP48fbwuangDx22XkJUzfyOGNd3w16+OGzRmxEGhoUXFfR+qzGrf3ALlxr
 o+Sn4QQN0ws5MYinMa5g0vnpkebKGsv091WTr9blkZec/lOH1udhSVcAbDxYlFdME9AZKsG3287
 yHB0fhceodThDFuU/PbIgztyhcmoZEm37NemTykeQVTqH2WDjtQe04ZEMI1RB4DUv+mEGxc56M0
 ja3FfQHpBHsZW6jo1mExavsApQ0B5bC+HgRYnfTsFDPRRMlPdY+/Mmu+9f/p9ShQKk+fhB/mqrL
 W5P0huTT8IRe8M+5jRMq3TbA8+KKMRbnFX7ZdNRfoJiWQYUb9NxDY4FhlIKRBrynssRZr0vOvsy
 YoLpXOKRS6NM2Nw8T5A==
X-Proofpoint-ORIG-GUID: 2WEpYNmLiSI7ew19HHf5oqhf0JfRGdu3
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69ca5c26 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JwhTZQfU3B_gdtkNLGYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 2WEpYNmLiSI7ew19HHf5oqhf0JfRGdu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300088
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: qcom-ethqos:
	set clk_csr
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:mohd.anwar@oss.qualcomm.com,m:andrew@lunn.ch,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.155];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: E8A2E35A19A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> The clocks for qcom-ethqos return a rate of zero as firmware manages
> their rate. According to hardware documentation, the clock which is
> fed to the slave AHB interface can crange between 50 and 100MHz.

FWIW this __may__ possibly differ between platforms, but I'm not sure
to what degree. Will there be visible impact if we e.g. have a 200 or
300 MHz clock somewhere?

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
