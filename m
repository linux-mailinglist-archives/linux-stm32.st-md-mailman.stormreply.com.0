Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iBM4Og6YT2rukQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 14:46:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E77B731282
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 14:46:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b="L0/y0OAl";
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b="RnRNA/w+";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 265F3C8F274;
	Thu,  9 Jul 2026 12:46:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88D67C5663A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 12:46:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 669BNEpp1488714
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 9 Jul 2026 12:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vhHFYSLcv+6lYQ28t2RolA7btajCBASXtU6eML3rNHg=; b=L0/y0OAl+AJJOS7f
 w1PWvdtiYchzvRoPPGZqJ5PC98dZZjGkwHWPnmyI6lPB4JZ+Ch5QzTuUsb8GAI3S
 uoOyMLGYwDBqyN8db+oziIhRKWnYKbKIYpB4Ugdo5K906W+JosP8C/9peN2Uic+6
 FrUTAqylERxjEUAC8DmesG62n6SDOCQ218Ur2HHgA0OdxxF/3QFMpg4n4HUH1DXo
 pW0BKIKVtQmUVYkWNrYqohMTHT1rT8KyUjqW+tA+tTm319j4f3QpsHe8QNaOfi/j
 80OoPdp1MGq2xuPTsx2olI93kDkLY+qvmWo8xaiC8KuMDkvJEPhRkOO05CRYVxZ5
 Amnd3w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfu7kp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2026 12:46:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c85a298cd62so1849393a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2026 05:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783601162; x=1784205962;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=vhHFYSLcv+6lYQ28t2RolA7btajCBASXtU6eML3rNHg=;
 b=RnRNA/w+g27l0vPliHcgeFopGBHyWxLU6kTpik0sWEUJowQUcYCgVyhwlbVX/jrfIO
 +by+l8ZTax639VRrjmSZbRTSiE+o1r++9TG3EYPrVy+pglsUosWLG5mX6Qn8I3oYSoK7
 QTV8Tj+HYpayw9EKnrJpxoCGD+YpGW61vB934HBS6CzkW+Bo/Z1QGikn5oJrRsbtj/lI
 4QiYPN71tLhLcYqbD/M6ILRSXmZAGBSbfcK9NOIBMOrKI7nr4hR4889LVfVuv2Frxbkx
 cyclYEzGO+s+Naaq7Y6Y/eli2+vyA4jnmmNo9UqKYTrKxsBgpL4gPHQLKCj+arXuutyE
 nOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783601162; x=1784205962;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vhHFYSLcv+6lYQ28t2RolA7btajCBASXtU6eML3rNHg=;
 b=jvnULFE0t1sXwqlFArKyGoutIG59ZXpEuV5toEwhKqoDHIWhpz2C5h4exv9ftEbw7/
 8a/qQa8FJ0h45S74n6eBHPjYNhmNjenHprSTLmSnet/ebPdC+G+gxAZmisih1+4YFhGA
 gj/PDjetQy5jqt8RZGi75eveLPSzknmSW0o8Oyc56M3PFXECGp/q3yq0O8m7U2WZlW3i
 nfnIAoKok+Oc3nhYIYEzRMcf8++Zv8grcXtHUrVdsT+kefvNCA0Pm/Vnir3e0XmZBQmr
 tTV7ocIb5zZ7jIuFn11MXgb1mMdB7focF5iPU2KMxDeeqOZ+IWpJehiJENecbDmce+Sd
 NtGA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqEiUx8IWqraPElcz4Tldrb9qZFG/qHMd4tqUzfDD3R+lFXIhFR4U0WU/btOrn7oTpV3W1ATQpwMkSo1g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzFZ4UXGmv30pLRUA1tajmgxHkl9bviXlxrjrj61BymQ6J6Tl/8
 bO8K6zSZ/kJB3vRxipiK5M6vjLgi9iSg9iKeogBJU0g0wrHEdOhSG0iO1nAnN4ohzO68uBWvQYo
 ExYGUGhPCT1RYtCU0Lbkd1UqKkH1rXb9bojDanclxY2U9X/Nv3Eni2EPh6CBDkq/yP1PmkzaVIt
 YAdBrtcmQ=
X-Gm-Gg: AfdE7clkLlvdmuKMsR0anRxXeMChCYMWHK32QFkRGMa0lOuQPcDwxYRRDCWnuaUZClR
 9/9OEDsxHv/vWoeheNhUpL9kKKKm1l/udR7xcCLfUSm6hqUNQqG+tSp32bseJEF3XxCn36aiJYl
 3hMW7TWux2xIMnT1Mtsr8RH0rKJPYz7nPNorONuwfm3BM2yvdPU2SKmeBNTFr3OSSxi+HZsxWAY
 hWlb5FFLC+f/RJQwWv5ey3zxGa1xKhZB+oBCQkO0kIUhMTbz7a7XZQQxuorWdckL6xl4naiUuDg
 LBTuOGbXz+WaeYstStn7Q+KGWhYBuAjdxfhBMETlDdrLdkksI7lpJfWblXS46gKslvQjevmHcZ8
 W1tzF3D8+HXOWgPASxMP84JA6TzynRYH4Y51dRoolN4I=
X-Received: by 2002:a05:6a20:3ca3:b0:39f:acae:f12e with SMTP id
 adf61e73a8af0-3c0bced482bmr10459337637.22.1783601161837; 
 Thu, 09 Jul 2026 05:46:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca3:b0:39f:acae:f12e with SMTP id
 adf61e73a8af0-3c0bced482bmr10459285637.22.1783601161268; 
 Thu, 09 Jul 2026 05:46:01 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.111.130])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31174ac178dsm31739101eec.28.2026.07.09.05.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 05:46:00 -0700 (PDT)
Message-ID: <bc3afb69-bcf0-4a73-a9df-4321c32707ea@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 18:15:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
 <5eecf3a0-b608-4057-b400-236f6952b380@oss.qualcomm.com>
 <ak906CqHYDooQTVu@ashevche-desk.local>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <ak906CqHYDooQTVu@ashevche-desk.local>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMyBTYWx0ZWRfX7sQ+TqPDFLz+
 yO31aoj1eilscIEnK4t+ZekOlaIULWXaogcrvl9FBJnjqk4cgCjyWwEyffYyuzSTrYiCtAjIRlo
 QSkQr/v4Fi+wjz+YIGPuOHtKHsSXgNqAgYvIBXAuYoG5cIijq+8042mWdIuUq8QeXU3E+iH0AJf
 e3bKkpB/VR05Crq72sL9JVOHkILXEiwFY5wV5TkfPJv78+AlQsFoQ0mqDxzJxq0aiVlwP/9bmqM
 RfuIecS8s/kzbACUoe2Zoa78mQh4JmElB8EKfu87YFf1L6nUtVmzN6ZOUPT3l4fWyfXMTx/1+EJ
 mE+fggKSNCILIan6JYz8Fgvm5Xw2IlY0OkwqLemhrQZDpMrIdU8PuNL8dKChcL+h8ry/taT323o
 rVx5dlWoVVsxzEjKZYI3lzWFLn5pJQ/ayxee7GF18KdCN53q+c+XKF3i3kPZOONdHyrzoMUQoql
 tQs52jb7oLW6tb2yEdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMyBTYWx0ZWRfX8/L6DTG+sF5W
 dsf7jlaCqzxtOn+zPkPHyAxHXaZm4zlsmwDE+pqEwj3vvDNDvEgJj4g3Y+eLLnYt5t5EFy1qEPg
 ys4ZT7gv/XOMDGtLDhEBn5PVCqe+ekM=
X-Proofpoint-ORIG-GUID: sW27TrQiqZDy7M4voLAslzPqxfAIcL8r
X-Proofpoint-GUID: sW27TrQiqZDy7M4voLAslzPqxfAIcL8r
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f980a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=vz+FLylpEn3mlzyIWlmD3A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=2TZWhx8y46JuiruMumEA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090123
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tony Lindgren <tony@atomide.com>, bjorn.andersson@oss.qualcomm.com,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 chandana.chiluveru@oss.qualcomm.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Korsgaard <jacmet@sunsite.dk>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 aniket.randive@oss.qualcomm.com, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, linux-mips@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 0/6] tty: serial: propagate errors from
 uart_ops.pm callback
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,atomide.com,oss.qualcomm.com,tuxon.dev,samsung.com,sunsite.dk,kernel.org,st-md-mailman.stormreply.com,vger.kernel.org,iki.fi,gmail.com,armlinux.org.uk,linaro.org,lists.infradead.org,linux.alibaba.com,linux.intel.com,amd.com,collabora.com,alpha.franken.de,linuxfoundation.org,microchip.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:alexandre.belloni@bootlin.com,m:tony@atomide.com,m:bjorn.andersson@oss.qualcomm.com,m:claudiu.beznea@tuxon.dev,m:mukesh.savaliya@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:alim.akhtar@samsung.com,m:jacmet@sunsite.dk,m:jirislaby@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-samsung-soc@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:aaro.koskinen@iki.fi,m:zhang.lyra@gmail.com,m:jmkrzyszt@gmail.com,m:linux@armlinux.org.uk,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:linux-serial@vger.kernel.org,m:orsonzhai@gmail.com,m:linux-mips@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:baolin.wang@linux.alibaba.com,m:ilpo.jarvinen@linux.intel.com,m:matthias.bgg@gmail.com,m:linux-omap@vger.kernel.org,m:michal.simek@amd.com,m:richard.genoud@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:konrad.dybcio@oss.qualcomm.c
 om,m:tsbogend@alpha.franken.de,m:gregkh@linuxfoundation.org,m:nicolas.ferre@microchip.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:zhanglyra@gmail.com,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E77B731282

Hi Andy

On 09-07-2026 15:46, Andy Shevchenko wrote:
> On Thu, Jul 09, 2026 at 02:22:17PM +0530, Praveen Talari wrote:
>> On 09-07-2026 12:23, Jiri Slaby wrote:
>>> On 09. 07. 26, 8:25, Praveen Talari wrote:
> ...
>
>>> OK, now I miss the rationale behind the patchset. Neither there is a
>>> possible code path to actually test this?
>> The rationale is that qcom_geni_serial_pm() calls
>> pm_runtime_resume_and_get() which can fail, but its return value is
>> currently discarded because the callback is void.
> So, you take the solution from a wrong end. Just get rid of .pm() in your driver.

Ok I agree. Now i can control resources via PM runtime APIs from 
startup(get_sync()) and shutdown(put_sync()) APIs right?

Thanks,

Praveen Talari

> With that, problem solved. Really, this series is a road to even more broken
> PM solutions.
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
