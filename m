Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id twbxMLFjT2otfwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 11:02:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A10FD72EA1A
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 11:02:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=Vzmdtsv4;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=NA2G+R1U;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8FE1C9AE44;
	Thu,  9 Jul 2026 09:02:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24560C7BF8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 08:52:37 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66960FNC931944
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 9 Jul 2026 08:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=; b=Vzmdtsv4Src4CMvg
 +mFiVwhDKpcjFXB+283QlPlKGH7IQKguo85jTg+HFc3wFGFSuuFLnxHQD9qv13PT
 7S/sayDY1+nx3mQ+hrAmpfkiafgteB8eT/y1X7YqJ+Eba5l+mKRfu78/Ot+e4G0l
 EhYIj072MvUflHuGCsTuuAjTg9QPrN2PiP8PCLjsPtjtqSZPvSc7kU0DnOE0ve+K
 Qq48+7qHO0c6pa/Qvx74sBAV2AN0fhnLy5O6H80paJOOaM4aoupOkuMRcTkk/itQ
 bnQYmf71v/cDQDxbjQ4xbE3vJX/+XYZFx1EUV5VsL/gdRSaIpkx/6CXvCjuAEvU/
 amWFRA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsbaat-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2026 08:52:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2c9ed5caa3bso8559925ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jul 2026 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783587156; x=1784191956;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=;
 b=NA2G+R1UPeftKQJFvF5VZR18PiyALgfKT7HyTOP6rvFDdVFnHe1EUgtd7SrQs5jezF
 jwdapNzrKDVZWzJKYi9r+zyFGhBtf+u8rilXGbD7xtEZUYavKj/Q11EwzRLIJ6hobB0Q
 DrJwNcziU/CAv7rXM9x+Mg46W4+12eDxG+e41LqzTW3VJxn8ARt6KTsPEM9+6AlH33wZ
 xkio23UM8YtXvjUpsUTF3LXGFjVnNhKbYF0wDhH6TOt+0nbHZlKtiT3oT253JtZjexZe
 6dI//QEgH1vBa7aj18fnn18YueHNNCMzfLp6tej6nI01i/H/Lzaw4roQMstt1hiuvgnQ
 uj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783587156; x=1784191956;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=;
 b=HID3CyuzwKdYw0pHnkhYNam86h1nnxeTpjOWHhJG0zaylb89OFR5KylJiSsJj9mnm2
 InOgCnM2zDzKSAgtd00NC8T5YwDitvZixbONdC7NKFFLoHczg18DwNYzxJaJtG5+eA00
 xQO40FXTCL362pp1vVUocmX+B4TvS6KKWVB9VzT4gY6KqtH+oifG2J+wQ/MQqF5NzSMx
 r08Y7BhyOgBrLvoYK/YPJ+71bNKKfFZO8vuCOqDjAxAXX5KEh7d/9yMtkq+b8TBShdIy
 u70oMeSbiSI4ouufw9z74ZRQDCC8TxSZNYnxYtOUjrM2Q5E6kn/9OGq7vUYMzsGsTSL1
 fsDA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrJvCKi6VWvypwKZrGr3lilqhnQPNO0bYA8Xz/xd1nVwgoejAMXI30CIdzNOgYeqaqxJlzee7R+xoDhUQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy/uD9zEuXxlDdF/5KqeHFZm2l60q1J08w0ld9hyWyMExdQT//5
 ROeK9HLnK0K5OaQEoJxdE1zjtHAlCfFQ6E2LEXdjaOXWeDVQUj27z94v9r5MY+K+QueGw/aMhYi
 kCeDHADCAsrBhPUcasYV4bML9fOnLf4iQ75dpr3yk/ihfWO6pJbjerb9Tftj0K1H99+O+cd8bqD
 WerVzgQeE=
X-Gm-Gg: AfdE7ck82UaAarH9f62TKH0ktSu6G5jcOQNRshjgps3Nbh4BACXIsElTqHIiBEdWE95
 HS00eeqGH//IkbSHGk3qxtZOK3PtU6KtYQk8KFHwWRtUD5x1aRETs7V/22DGvGk9Cl/xBWcCwo0
 8hw6XCrKQ8nH+tDRnWqiqc8+cjY0gMv8J+YXAiJfH+UqyHW6uLtAbj2Kz4i6aF/9QERe7UQQUg4
 TNqHNwOeL6dHGvigeEkhmjFPfWeHjXlQAU01zbSbvHky5Ennmj/tqVaLP19QKYA54vYogf8zBdK
 dikJVLdnSzIo72dsChBmbLC4UpEPlg1zT63oXb0T9XW2ByA+U/oieuRjwjmUtnNksRxTXk3VIJS
 OT7i53GBTeKqWnvCQtpIddGWlHqEuERhSMZXZCOyK31s=
X-Received: by 2002:a17:902:d2c1:b0:2c9:b2c1:1401 with SMTP id
 d9443c01a7336-2cdd8a16112mr22278255ad.5.1783587155471; 
 Thu, 09 Jul 2026 01:52:35 -0700 (PDT)
X-Received: by 2002:a17:902:d2c1:b0:2c9:b2c1:1401 with SMTP id
 d9443c01a7336-2cdd8a16112mr22277765ad.5.1783587154710; 
 Thu, 09 Jul 2026 01:52:34 -0700 (PDT)
Received: from [10.92.212.146] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3d946sm40530765ad.66.2026.07.09.01.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 01:52:33 -0700 (PDT)
Message-ID: <5eecf3a0-b608-4057-b400-236f6952b380@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:22:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiri Slaby <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Peter Korsgaard <jacmet@sunsite.dk>, Michal Simek <michal.simek@amd.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 bjorn.andersson@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX/McPrNIEOGaa
 Tf8RNmFvWb13RLuEPmulZvcH68DbrL1V0QnZqeK/WthZ3dFIujAsVsSMGgWbmBqNjn3WolfCuGl
 lhZN1R4PsYPvh2ofg8aGU/UCxNc6XgI=
X-Proofpoint-GUID: 7k4a-urkIuncaWKr9egEKjafGmB2W_uw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX9nsdsKhzPLdt
 QRGlqJBuVHoQbLxW4tp2vGhSzWpC7vrYo7mHhcSNkJgMW4Be5nvP6EsFpS+DPre4FaFjYzyWpUo
 EE0MiN7w20B96OK9U6gmnQz9HVa7Rhf2WufMoPohAplGTpEAam8iSOwCzPOO5KYAc44Oq6mQepR
 7XNwfuZcvFGENBewaNYtjxu2IPj3dDvqy9OAj4qPPHXa/jTKX2KrydbPzq9mulaYwNegPYmx/2T
 f70z/7asOr0D9OKSNLcoFi3TDDPEpe4w29iR5dNCGhkSZAia4Hfldv6OXPas+ZGihG/eZ1BUVth
 gUAJkIp8c7HeNkx8xl5FAaSK9AE5u9RBMPSctkLW30xD/EitBabOkBLfVcEPqeENRW6ZoxE8MnH
 3i+ni8aDZiDxUnSmoarwRygvi7DuOLLFeF14x4IEfS7ZZcB/qhL+SHzHmHWpifw2AANNfUQ4YI0
 /g4RzVtwxIJwj9X0AFA==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f6154 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=yxy72PdV_TLAuk9cO2cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 7k4a-urkIuncaWKr9egEKjafGmB2W_uw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090083
X-Mailman-Approved-At: Thu, 09 Jul 2026 09:02:39 +0000
Cc: linux-samsung-soc@vger.kernel.org, aniket.randive@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 chandana.chiluveru@oss.qualcomm.com, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,atomide.com,armlinux.org.uk,alpha.franken.de,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:jirislaby@kernel.org,m:gregkh@linuxfoundation.org,m:ilpo.jarvinen@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:tony@atomide.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-samsung-soc@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:chand
 ana.chiluveru@oss.qualcomm.com,m:linux-mediatek@lists.infradead.org,m:linux-serial@vger.kernel.org,m:linux-omap@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[40];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,uart_ops.pm:url,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A10FD72EA1A

SEkgSmlyaQoKT24gMDktMDctMjAyNiAxMjoyMywgSmlyaSBTbGFieSB3cm90ZToKPiBPbiAwOS4g
MDcuIDI2LCA4OjI1LCBQcmF2ZWVuIFRhbGFyaSB3cm90ZToKPj4gVGhlIHVhcnRfb3BzLnBtIGNh
bGxiYWNrIGhhcyBiZWVuIGRlY2xhcmVkIHZvaWQgc2luY2UgaXRzIGludHJvZHVjdGlvbiwKPj4g
d2hpY2ggbWVhbnMgYW55IGVycm9yIGZyb20gYSBkcml2ZXIncyBwb3dlciBtYW5hZ2VtZW50IGlt
cGxlbWVudGF0aW9uIGlzCj4+IHNpbGVudGx5IGRpc2NhcmRlZCBieSB1YXJ0X2NoYW5nZV9wbSgp
LiBCZXlvbmQgbG9zaW5nIHRoZSBlcnJvcgo+PiBpbmZvcm1hdGlvbiwgdWFydF9jaGFuZ2VfcG0o
KSB1bmNvbmRpdGlvbmFsbHkgdXBkYXRlcyBzdGF0ZS0+cG1fc3RhdGUKPj4gZXZlbiB3aGVuIHRo
ZSB1bmRlcmx5aW5nIGhhcmR3YXJlIHRyYW5zaXRpb24gZmFpbGVkLiBUaGlzIGNhdXNlcyB0aGUK
Pj4gc2VyaWFsIGNvcmUgdG8gdHJhY2sgYSBwb3dlciBzdGF0ZSB0aGF0IGRvZXMgbm90IHJlZmxl
Y3QgcmVhbGl0eToKPj4gc3Vic2VxdWVudCBjYWxscyB0byB1YXJ0X2NoYW5nZV9wbSgpIHNlZSB0
aGUgc3RhbGUgY2FjaGVkIHN0YXRlIGFzCj4+IG1hdGNoaW5nIHRoZSByZXF1ZXN0ZWQgc3RhdGUg
YW5kIHNraXAgdGhlIGNhbGxiYWNrIGVudGlyZWx5LCBsZWF2aW5nIHRoZQo+PiBoYXJkd2FyZSBw
ZXJtYW5lbnRseSBzdHVjayB3aXRoIG5vIGZ1cnRoZXIgcmVjb3ZlcnkgYXR0ZW1wdC4KPj4KPj4g
T24gbW9kZXJuIHBsYXRmb3JtcyB3aGVyZSB0aGUgLnBtIGNhbGxiYWNrIHBlcmZvcm1zIHJlYWwg
d29yayDigJQKPj4gZW5hYmxpbmcgY2xvY2sgdHJlZXMsIGludGVyYWN0aW5nIHdpdGggcnVudGlt
ZSBQTSwgYXNzZXJ0aW5nIHZvbHRhZ2UKPj4gcmVndWxhdG9ycyDigJQgdGhpcyBpcyBhIGNvcnJl
Y3RuZXNzIGdhcC4gRmFpbHVyZXMgYXJlIGludmlzaWJsZSB0byB0aGUKPj4gUE0gZnJhbWV3b3Jr
LCB0aGUgcG9ydCBwcm9jZWVkcyB0byBjYWxsIG9wcy0+c3RhcnR1cCgpIG9uIHBvdGVudGlhbGx5
Cj4+IHVucG93ZXJlZCBoYXJkd2FyZSwgYW5kIHN1c3BlbmQvcmVzdW1lIGVycm9ycyBhcmUgaGlk
ZGVuIGZyb20gdGhlIGNvcmUKPj4gdGhhdCBuZWVkcyB0byBoYW5kbGUgdGhlbS4KPj4KPj4gVGhp
cyBzZXJpZXMgZml4ZXMgdGhlIHByb2JsZW0gaW4gZm91ciBzdGVwczoKPj4KPj4gwqDCoCBQYXRj
aCAxIGNoYW5nZXMgdGhlIHVhcnRfb3BzLnBtIGNhbGxiYWNrIHNpZ25hdHVyZSBmcm9tIHZvaWQg
dG8gaW50LAo+PiDCoMKgIHVwZGF0ZXMgdWFydF9jaGFuZ2VfcG0oKSB0byBwcm9wYWdhdGUgZXJy
b3JzIGFuZCBvbmx5IGNvbW1pdAo+PiDCoMKgIHN0YXRlLT5wbV9zdGF0ZSBvbiBzdWNjZXNzLCBh
bmQgaGFuZGxlcyB0aGUgcmV0dXJuIHZhbHVlIGF0IGV2ZXJ5Cj4+IMKgwqAgY2FsbCBzaXRlIGlu
IHNlcmlhbF9jb3JlLmMgd2l0aCBhcHByb3ByaWF0ZSBwb2xpY3kgcGVyIGNvbnRleHQKPj4gwqDC
oCAocHJvcGFnYXRlLCBsb2csIG9yIHNraXAtb24tZmFpbHVyZSkuCj4KPiBTbyBkb2VzIHRoaXMg
YnJlYWsgYnVpbGQgd2l0aG91dCB0aGUgYmVsb3cgYXBwbGllZD8gSU9XOiBicmVha3MgCj4gYmlz
ZWN0YWJpbGl0eT8KCllvdSBhcmUgcmlnaHQsIHBhdGNoIDEgYWxvbmUgYnJlYWtzIHRoZSBidWls
ZCBzaW5jZSB0aGUgZHJpdmVyIAppbXBsZW1lbnRhdGlvbnMgYXJlIHN0aWxsIHZvaWQgdW50aWwg
cGF0Y2hlcyAy4oCTNC4gVGhlIHNlcmllcyBhcyAKc3RydWN0dXJlZCBpcyBub3QgYmlzZWN0LXNh
ZmUuCgpEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgb24gaG93IHRvIGZpeCB0aGlzIGlzc3Vl
PwoKPgo+PiDCoMKgIFBhdGNoIDIgdXBkYXRlcyB0aGUgODI1MCBkcml2ZXIgZmFtaWx5OiBzZXJp
YWw4MjUwX2RvX3BtKCkgYW5kCj4+IMKgwqAgc2VyaWFsODI1MF9wbSgpIGFyZSB1cGRhdGVkIHRv
IHJldHVybiBpbnQgKHdpdGggdGhlIGV4cG9ydGVkIHN5bWJvbAo+PiDCoMKgIGRlY2xhcmF0aW9u
IHVwZGF0ZWQgaW4gc2VyaWFsXzgyNTAuaCksIGFuZCB0aGUgODI1MCBzdWItZHJpdmVyCj4+IMKg
wqAgcG0gY2FsbGJhY2tzIGFyZSB1cGRhdGVkIHRvIHJldHVybiAwLgo+Pgo+PiDCoMKgIFBhdGNo
IDMgdXBkYXRlcyB0aGUgcmVtYWluaW5nIG5vbi04MjUwIHNlcmlhbCBkcml2ZXJzLiBBbGwgLnBt
Cj4+IMKgwqAgaW1wbGVtZW50YXRpb25zIGFyZSB1cGRhdGVkIHRvIHJldHVybiAwLiBUaGUgc2gt
c2NpIGZvcndhcmQKPj4gwqDCoCBkZWNsYXJhdGlvbiBzaGFyZWQgd2l0aCByc2NpIGlzIGFsc28g
dXBkYXRlZC4KPj4KPj4gwqDCoCBQYXRjaCA0IHVwZGF0ZXMgYXJjaC1sZXZlbCBpbXBsZW1lbnRh
dGlvbnM6IFNBMTEwMCAoYXNzYWJldCwgaDN4eHgpLAo+PiDCoMKgIE9NQVAxL2Ftcy1kZWx0YSAo
bW9kZW1fcG0sIG5vdyBwcm9wYWdhdGVzIHJlZ3VsYXRvciBlcnJvcnMpLCBhbmQKPj4gwqDCoCBN
SVBTL0FsY2hlbXkgKGFsY2hlbXlfODI1MF9wbSkuCj4+Cj4+IEFsbCBleGlzdGluZyAucG0gaW1w
bGVtZW50YXRpb25zIHJldHVybiAwLCBzbyB0aGVyZSBpcyBubyBmdW5jdGlvbmFsCj4+IGNoYW5n
ZSBmb3IgYW55IGN1cnJlbnQgZHJpdmVyLiBUaGUgc2VyaWVzIHB1cmVseSBhZGRzIHRoZSBpbmZy
YXN0cnVjdHVyZQo+PiBmb3IgZHJpdmVycyB0byByZXBvcnQgZXJyb3JzIGdvaW5nIGZvcndhcmQs
IHdpdGggdGhlIHNlcmlhbCBjb3JlIHJlYWR5Cj4+IHRvIGhhbmRsZSB0aGVtIGNvcnJlY3RseS4K
Pgo+IE9LLCBub3cgSSBtaXNzIHRoZSByYXRpb25hbGUgYmVoaW5kIHRoZSBwYXRjaHNldC4gTmVp
dGhlciB0aGVyZSBpcyBhIAo+IHBvc3NpYmxlIGNvZGUgcGF0aCB0byBhY3R1YWxseSB0ZXN0IHRo
aXM/ClRoZSByYXRpb25hbGUgaXMgdGhhdCBxY29tX2dlbmlfc2VyaWFsX3BtKCkgY2FsbHMgCnBt
X3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKSB3aGljaCBjYW4gZmFpbCwgYnV0IGl0cyByZXR1cm4g
dmFsdWUgaXMgCmN1cnJlbnRseSBkaXNjYXJkZWQgYmVjYXVzZSB0aGUgY2FsbGJhY2sgaXMgdm9p
ZC4gUGF0Y2ggNiBpbiB0aGlzIHNlcmllcyAKaXMgdGhlIGNvbmNyZXRlIHVzZXI6IGl0IG1ha2Vz
IHFjb21fZ2VuaV9zZXJpYWxfcG0oKSBwcm9wYWdhdGUgdGhlIApwbV9ydW50aW1lX3Jlc3VtZV9h
bmRfZ2V0KCkgZXJyb3Igc28gdGhhdCBhIGZhaWx1cmUgdG8gcmVzdW1lIHRoZSBVQVJUIApwb3dl
ciBkb21haW4gaXMgdmlzaWJsZSBhdCB1YXJ0X3BvcnRfc3RhcnR1cCgpIHRpbWUgcmF0aGVyIHRo
YW4gc2lsZW50bHkgCnByb2NlZWRpbmcgdG8gY2FsbCBvcHMtPnN0YXJ0dXAoKSBvbiBhbiB1bnBv
d2VyZWQgcG9ydC4KCkEgY29kZSBwYXRoIHRvIHRlc3Q6IG9uIHFjb20gcGxhdGZvcm1zIHdpdGgg
Q09ORklHX1NFUklBTF9RQ09NX0dFTkkgCmVuYWJsZWQsIGlmIHBtX3J1bnRpbWVfcmVzdW1lX2Fu
ZF9nZXQoKSBmYWlscyBkdXJpbmcgCnVhcnRfY29uZmlndXJlX3BvcnQoKSBvciB1YXJ0X3BvcnRf
c3RhcnR1cCgpLCB0aGUgZXJyb3Igbm93IHByb3BhZ2F0ZXMgCnRvIHRoZSBjYWxsZXIgaW5zdGVh
ZCBvZiBiZWluZyBkcm9wcGVkLiBUaGUgdGVzdCBjYXNlIGZyb20gZGV2ZWxvcG1lbnQgCndhcyBp
bmplY3RpbmcgYSBmYWlsdXJlIGluIHFjb21fZ2VuaV9zZXJpYWxfcG0oKSBhbmQgb2JzZXJ2aW5n
IHRoYXQgCnVhcnRfYWRkX29uZV9wb3J0KCkgcmV0dXJucyBhbiBlcnJvciByYXRoZXIgdGhhbiBw
cm9jZWVkaW5nIHNpbGVudGx5LgoKVGhhbmtzLAoKUHJhdmVlbiBUYWxhcmkKCj4KPiB0aGFua3Ms
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
