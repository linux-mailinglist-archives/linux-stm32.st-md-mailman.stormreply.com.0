Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCpZJ9IjnGkPAAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:54:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7CB1744B3
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:54:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1F88C36B3E;
	Mon, 23 Feb 2026 09:54:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F16DEC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 09:54:24 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61MMAjmt2154922
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 23 Feb 2026 09:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pMJwRoenSFg2hWtcaGyYH8c9
 1ypYkTPXJQa7dQ0lvIo=; b=BDEBQYHNvvIodIsKxbVwYcsC/q55fMTVS8gWXSn1
 MvlVMX+3JOBrmIW2f0FYtqQF0zbS7d3tCBxxVzCURPXuzIIfBLsqHHP/YLgnjWi9
 OiZUT+7M00nUxbDFIWgxX/bOW8X7GQ3tk0EX62ZL2++o7vr12d05QZszV+TiDlLa
 PC/IELJi2W/iuEr3GvdymOFzrOSReh8b/OMzDkuIxfVQuRGAElNfz0FcMahEgEtp
 9hnnBQ59d9E9TY+up3xVynDcHVGEoGVevKt3NxQ10pBbWXL52sJYSBwqsdDM4Sl0
 RWr/t+bjK7Pr7g+CfHSUjWoTcVaROPZPUNPWBjGJrd3SLQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vum5kk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 09:54:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2a8f8c81d02so53299235ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 01:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771840462; x=1772445262;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pMJwRoenSFg2hWtcaGyYH8c91ypYkTPXJQa7dQ0lvIo=;
 b=e1S1iUvvmX066Cr5pS36DvRvQCJTPpWXbP126KwSoev7bw2ri7iaLpYqBYvVztZh3R
 RAGvW1SQvD541A4k+iM/FbQd+0+jGVKQ7Q6ca5vF0RgBQWJT1jqITN04h5MvQG5UOgMc
 k5FAk0rsULHsyaLYg5pB6CX9Wp77JMJskTzRiO+hW/mT9R5Ai4hQdo1NehJpZU03RzJ4
 duQVpqNP007HAFMjUSfVDl26HInUrI7w6vFbhOhs+/wIU/EZOYIitXZle9HRLXBn/nW+
 nCcRGSfq2FQ+nU6ShMhZ0KM8n2k0KBugsg6FAQ2l8oyITCLfb+E3yWSXam43p2wCBrT9
 XL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771840462; x=1772445262;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pMJwRoenSFg2hWtcaGyYH8c91ypYkTPXJQa7dQ0lvIo=;
 b=Y373Na8jwmbKfK5xENaUrhd4DrX/ex9bsyHCFeSCwvGAyhGaOq6sWY7AcKIHk+gbgg
 +WIx4D22CDS7tYPYWhin2W4Aa5PoCOvVFYThM2siXpv9uDZpJaSJ3+GyWPaLVXba6O91
 f3xVjGbfWzRCWg+T8lJGA0VbzbS6/o3Ukylv+oivy1/AtKqtDK8+twPiaBimf515kARj
 mNOPYD4tVSLxo++uzOWm7wFakJgQXlp4qnzKyCIyKRwXR0wqmd84kP6VUC3iEH6MNgsb
 AbS/hUSCdY1jP5KzknDT5EnolDS/npTA4P5fOULDo5SBAqslIAaylbPHfpFvqhnERPFZ
 +fhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpBFqAiS75y/Raq0PU3CqubWZeWf8+4M7cu6uQFQSI6Yt59WEyNzZtOJ6MUo17FFT2k+h/6b+HHB5y1g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzcHxKHkmDIOoTIVgVJI2bfoBVtceqV7AOa/mOobmTEbnprlZXs
 VdBurb/+vRDBSUqBltekK1baB9tq8V+Re5eADe35jgZLQb1GAyIjAPlIOyPrXmAmfzjnxn5xRI2
 mupU5cQmz0L2Dm5oJgfiOZaBVVxOBKxoUz9eA9yqjeAf0igDSicLvvIITsKL4L28sYaJzrerFcW
 MDa1yRk88=
X-Gm-Gg: ATEYQzy21SSTYK46W+6pyWC/6IT866pcYgIQ68SW13kB7M/GVsurJ4Ab1UoAl2pxalR
 Xv9l5Z2G3p9tKtHPrNDL9T/WfXqLWLKQPJdkb2/mpzkdOJFv55hHCLS52KNPTz8/pqjj3mkNMkW
 JlU0/enRHPQrqpjQXGV0UL/A+KMBqfn8PXvpjrvvHkwefeK+OD5Ya0k+5IOIwInNKw525CHTYot
 oCjHaaVXsupIgdG/oacQi/xRP2oQPv6GU5yvcrimLuOUFudAqA972WJ+RB2TYOGjUC33ywrZ/TW
 3OXV3DK5U/I+RNSvKbXHaMKVfY6VC/r5ZUVxMIPgzr8k679f2mjPWGm0fVB0ielRUBJEZ/wsGj+
 zC1JwvTq/nC5zglqbrWKqJwJKgWAcc2vKu8M=
X-Received: by 2002:a17:90b:48ce:b0:340:ec6f:5ac5 with SMTP id
 98e67ed59e1d1-358ae7c3134mr5861409a91.2.1771840462353; 
 Mon, 23 Feb 2026 01:54:22 -0800 (PST)
X-Received: by 2002:a17:90b:48ce:b0:340:ec6f:5ac5 with SMTP id
 98e67ed59e1d1-358ae7c3134mr5861383a91.2.1771840461811; 
 Mon, 23 Feb 2026 01:54:21 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-358af93b9d1sm6128924a91.15.2026.02.23.01.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 01:54:21 -0800 (PST)
Date: Mon, 23 Feb 2026 15:24:15 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <aZwjx9pKFROhF5DN@oss.qualcomm.com>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
 <E1vt3Us-0000000A5ei-04Bg@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vt3Us-0000000A5ei-04Bg@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c23cf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=_j33rwhWCIcg66mWb4UA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: vWKdhN1O5ntxcAmVFs_wXUgNyqIs3Jvp
X-Proofpoint-ORIG-GUID: vWKdhN1O5ntxcAmVFs_wXUgNyqIs3Jvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfXyuavxes7gfwZ
 cGgQXMGMVQzfyPskh7GBMVKv8NhNa+FBKayv9uEjJ1JKzcu6E9A+LhWbThraxEXeXuGVGXyH996
 Mc9anjxYa7ZOKIvJNDEr+c/BXx08IDXp4LBkewSM8aTBgoiVv4gkeNj6kufRklAmH9z8oZCrJS2
 UurcOz4bEdJ70q3yMp3k/Ry4IA4BAJtj7b/jvjlIsCiba5VdWAxJH/Aw7E/nrnesvdKFLWAWfgs
 NneeADkio8CzUnRq02UYMX6qfd+NIBx8QCk+e1VwkRcsBHy0xyETpOqnfhZAiOvF+5ahk7Cs4gL
 muO2fj9YfTT+fiVleNUDD97EJLswkH3PC9n/CdrjtyOWcu/Ei2eqBpHsniIdeK/ETKZjl7XieKY
 VUqC1N2L4QzY316uy6oJvHEj6+xlgm5rVOvdiOQE+ZLuK/CGVkJsifqMcFDNEfHBYm5rqCBTh7u
 yszqHLW1HU48hDOQQCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next+ 9/9] net: stmmac:
 qcom-ethqos: remove phy_set_mode_ext() after phy_power_on()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.949];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,armlinux.org.uk:email,oss.qualcomm.com:mid,qualcomm.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 3F7CB1744B3
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 12:51:10PM +0000, Russell King (Oracle) wrote:
> The call to phy_set_mode_ext() after phy_power_on() was a work-around
> for the qcom-sgmii-eth SerDes driver that only re-enabled its clocks on
> phy_power_on() but did not configure the PHY. Now that the SerDes driver
> fully configures the SerDes at phy_power_on(), there is no need to call
> phy_set_mode_ext() immediately afterwards.
> 
> This also means we no longer need to record the previous operating mode
> of the driver - this is up to the SerDes driver. In any case, the only
> thing that we care about is the SerDes provides the necessary clocks to
> the stmmac core to allow it to reset at this point. The actual mode is
> irrelevant at this point as the correct mode will be configured in
> ethqos_mac_finish_serdes() just before the network device is brought
> online.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c         | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
