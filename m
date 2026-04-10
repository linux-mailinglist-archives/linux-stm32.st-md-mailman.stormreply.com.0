Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPbRDf3B2Gk4hwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 11:25:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A69883D4B33
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 11:25:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0140FC87EC6;
	Fri, 10 Apr 2026 09:25:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1FD4C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 09:25:14 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63A6s6QS1433128
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 10 Apr 2026 09:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=; b=a509YB39uX5tBQyI
 MjdoU+aJR0HNKGwFxdLofDnW3SsFSU24zL9ESi4TehUi3fyuVpBvH9sPzuSjd21Z
 WPArMGUJfTGQTvyxzHZZetdoNiDcRYooORs9IyzieI7ZvZmPk23l3yitHyphFSgy
 WMBGL8Kf30ex3bNoL5zmkOCAP4/mNOPk2X1FPDZdZe6slBVeW4vAdmf2yVlIR3k/
 vWGH1o1WA862w0rHTZDEhhvQCslSWgNj8fxLJeSgKgkDT1jVAJY2MmV6i9Ce3ScD
 HJgUgjdLvSmgnZbQC4ofa2fNmSp4vF39don63K1KqiNPjrXzG4mWuqqd7Jy/8muu
 tFQ/Pw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfbmrv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 09:25:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-c70ea91bfe1so1076206a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 02:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1775813112; x=1776417912;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=;
 b=C9Hf+hrxQrRVur6S+I/gKg/4kDrQx+j/MXgTHBm9SHQpbqoMVnopmLL4gkbKYl319Q
 c+OYC9TTFojj5ymcuu0RztMGAf1mWMYqic6X7/DTZotj1PrbYOJ9EExcI7ho6eiWbp43
 gIt+0lC2Z3LG8Z8Ugd+S/pFiba+QlQZsQKuy/ktI5g3NWOI8l0N+YdETlW16fjyPI9F9
 XsT06OJsSHi+ewksBGwbuvwMgkGzCtTIgLu+pVnfwMhXNHgVh3d3ZrMAiCB0OCd4swT+
 8Ouq2qZJ3dDwZGMXmY5Id1+8Fc++yZ4OKEwmXbvytxPTX7JVpWt3TKMJqXRPjIm5PaHs
 a5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775813112; x=1776417912;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zppDPlPSoF+PZXY02Fmm39wQPhKDV88OsYILD0VRerM=;
 b=BXW8n6zfdPCIxM72GzEyjruWO7gk4mS4ZEGEDulO4V1FkVQ6Ss6TFzxWyDamEnbedN
 /U+wvY5C2K8LY+NoTpVps6CzdSARIZwc2FEk8OzfBUCY58+pEe0YAnQ+XE9v4SMDHNIz
 wbyMQj76V7DyOz1t929lqdtyhK1XyONl1TevNsww8w/xmLpokH6TU2QtjJW10Zs0mU/4
 wb6jxd1pSCALvtJgET3R9pGB8vuSiwyjrvDTyVdPBBylyWKYyc0hR0IP0ADwlZVRz1/2
 KClWvwVw37th4tD0nGF1H2b+LAWChCNhECrP5+jc9TjggQMZhMfFWVhSPpzSyBZejcc2
 QX2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXANeNiCwFISfFATHERnaM2+/Oby3Y48FcNrU0C5crUOUQx10Ghv1byT23XZYdlYhKuk11GaJaZGs7fsQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwxsLeYreXR0WwXKjYJGuqHUT4EPNa/m7Axuvua4fY8MVQ3qoJl
 kgXVEIVfx1+tfs2ZSURsREm9jzX4Vy4tUxU2I+KBo3kXcfI+69WTkxDeYPNuZQMZvMUs0ClPUUE
 210pluWy4JqZKT19mWz6lnnrkCObvt0xnGOjOvDjXy3RuEG5Iuw7LOtTdLpnoAkR4nVQiqg4Ym7
 T/7e76F4Y=
X-Gm-Gg: AeBDiev7DfAIMPwZJTOugVnWphQUA5REz/+F0+BM7ThWjQ42BI/HHGS562Pp5G4kXHx
 goJEd9xHg57nD17YWTbz8c9uWw1A4eW6nvMydSoJsEy7BUxr6PLlHnRVHK2N1OtUaB3oq2uGZq7
 UkYqnA65xkjOzpVK3NdkOWx4n7do/ahY2ZESy8ghzpzscjkx/X8ZyPFQV+Gz8WdWBZkTvbI3Haw
 oRa602FJULGdhXvMStea0y128pivqLVq3JhXpSSrDHlARDdcTh+WUlF/jUmG3CpM+WEJSPj53RM
 JIUfAedo67R+Y3bk+iVPgxKbORE3uKXrD1X7/0JJPEjIVSqqFz7ACkpyrruk6LHz0cdk9VDc/km
 gLo5HGtdxZUxGvrwlHvMpEmTFkDobz1Q1QiylYSj4jAL+dc2P
X-Received: by 2002:a05:6a00:1bcd:b0:82c:24d5:63e6 with SMTP id
 d2e1a72fcca58-82f0c169049mr2705989b3a.15.1775813112218; 
 Fri, 10 Apr 2026 02:25:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:1bcd:b0:82c:24d5:63e6 with SMTP id
 d2e1a72fcca58-82f0c169049mr2705947b3a.15.1775813111521; 
 Fri, 10 Apr 2026 02:25:11 -0700 (PDT)
Received: from [10.218.28.224] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f0c506150sm2123732b3a.52.2026.04.10.02.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 02:25:11 -0700 (PDT)
Message-ID: <80d60c30-7e60-4233-b072-3d3719533481@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 14:55:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <20260410-ludicrous-rousing-pudu-dbe5be@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260410-ludicrous-rousing-pudu-dbe5be@quoll>
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d8c1f9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=MbdO6sGYhmOsAQUEtOMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4NyBTYWx0ZWRfX8Zalm7haPZp4
 JzxJNNCs7QMpaVEnxnh8CoTlDhx7tzjYvhHzq8S2YWvDaPVyIW/U4KJuCJbhKdnMNnjoGhfympW
 4jjZEvtvfj+wZ7NLuqArE9EeLnMlIPjgMjvRNDuzD9Xzne+dIpQa0xBctCB+5iznROWT8CPkzX7
 WOnEOgHoyvxZmhLF0f03YGLyxC667GqE5leezcBgVlFf189bpH5Ygb7ztgzGQVVS7qzcHqqzKbv
 lHG7KVCifGhL7znR+Z+J5mLrD5mkLrT0DfZHqfgwakyL/pztGA/EaLzuqRx731gCMKWwn419kv6
 jt7WJU30zapfd9hIaJQwgprcBfhpwEPAlUmvuZom63v3UXD6Ch4njMHYFFPKwcnRSEEmMq5nOeG
 sN6ptbDF+DRh3DfnCkL7K59QJkNQXtzueK2bZRAP2jJDLZYNaXTbNqggm/T9IwgXRFH2xlm0/4f
 0ReA+Scc/mXrR8r1yVA==
X-Proofpoint-ORIG-GUID: t8ZL_FUfPPE6goHLLX8rASuLD32AzG-p
X-Proofpoint-GUID: t8ZL_FUfPPE6goHLLX8rASuLD32AzG-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100087
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
Subject: Re: [Linux-stm32] [PATCH v2 8/8] arm64: dts: qcom: eliza: Add
 support for MM clock controllers
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
	NEURAL_HAM(-0.00)[-0.618];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: A69883D4B33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/10/2026 1:14 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 09, 2026 at 11:40:49PM +0530, Taniya Das wrote:
>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 54 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
> 
> Note that this patch and drivers parches were likely not tested.
> 
> Please mark patches you wish others to test as RFT.
> 

Krzysztof, please find the logs, if you need the clk_summary I can add
those as well.


/ # dmesg
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd801]
[    0.000000] Linux version
7.0.0-rc7-next-20260408-00008-g476992104d28-dirty ()
(aarch64-linux-gnu-gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0, GNU ld
(GNU Binutils for Ubuntu) 2.38) #19 SMP PREEMPT Thu Apr  9 16:46:11
+0530 2026
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: Qualcomm Technologies, Inc. Eliza MTP
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] earlycon: qcom_geni0 at MMIO 0x0000000000894000 (options
'115200n8')
[    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
[    0.000000] OF: reserved mem: 0x0000000080000000..0x0000000080dfffff
(14336 KiB) nomap non-reusable gunyah-hyp@80000000
[    0.000000] OF: reserved mem: 0x0000000080e00000..0x0000000080e3ffff
(256 KiB) nomap non-reusable cpusys-vm-mem@80e00000
[    0.000000] OF: reserved mem: 0x0000000081200000..0x00000000813fffff
(2048 KiB) nomap non-reusable cpucp@81200000
[    0.000000] OF: reserved mem: 0x0000000081a00000..0x0000000081a3ffff
(256 KiB) nomap non-reusable xbl-dtlog@81a00000
[    0.000000] OF: reserved mem: 0x0000000081c00000..0x0000000081c5ffff
(384 KiB) nomap non-reusable aop-image@81c00000
[    0.000000] OF: reserved mem: 0x0000000081c60000..0x0000000081c7ffff
(128 KiB) nomap non-reusable aop-cmd-db@81c60000
[    0.000000] OF: reserved mem: 0x0000000081c80000..0x0000000081cf3fff
(464 KiB) nomap non-reusable aop-tme-uefi-merged@81c80000





-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
