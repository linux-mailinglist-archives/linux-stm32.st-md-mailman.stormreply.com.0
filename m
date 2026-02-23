Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOrgAMYinGkZ/wMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:49:58 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF907174331
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Feb 2026 10:49:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64547C36B3E;
	Mon, 23 Feb 2026 09:49:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C045DC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 09:49:54 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61N9KrE11351113
 for <linux-stm32@st-md-mailman.stormreply.com>; Mon, 23 Feb 2026 09:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rkJsbjgrPmHKuVtyeITCWuo6
 Qs6gxTemZ0gXWydw0S4=; b=MCroSxMvREUglMMehsXfDVNamKc0VZ2SKpcGWJ0E
 KtIeAX+q39tjNd4AxG8zfLt9aSVvhKXjUMeriw+of3z3bKy8KMHwJ5ONzmMkdZF+
 viYUPm3k+rHg4g3UnEFe1heRxC6sAMYwsdUp6JN7iEOZHXZBflhIaU7/Mb7MN3Ay
 IvnDpZz9UVH+J6N+9hv2fnsUKL6ELzl//e7qYElVE1Dxnn1GT+Nzv0Lg9JOzhAWz
 pVQv2fLokAUCp3WPaIIE0Ma6lnuxR1Ufrsarf0OKt4tWTu4br/A4fVert1QvQOsj
 4+8mcBHgYqY573DG4sdZVwiYgpG6xKVlWWGN43WC4PIJew==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7v885-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 09:49:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-8243fc3fe8eso16070977b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Feb 2026 01:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771840192; x=1772444992;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rkJsbjgrPmHKuVtyeITCWuo6Qs6gxTemZ0gXWydw0S4=;
 b=je/3u/EJb8jIZndksVVRJ0xgxQeTqSNLyuEF4RTFQ5QXt/pFNlSU4bjKUNv1FZNEDX
 NuCqqhyPqwq4NPD5APLIWYQ1/J2yeSuvtN2Vl86Ms46UF9w1U8puOIivq86rCY+SnDqZ
 jeqkn+cs7RIonB4ttTGxhxWQs5E2ZGYQcLreq8Tl8/Q/bnE2rX+Q0oY00450+bD0DygP
 Tl+xZjEYxRzEord9XQD87lmte8qaGCFGoe6uXtWprlxzB2D7/gKE+l8+O9ipHUnmF+In
 ugn3LjItAhUrdcWLu4zL/yiOIOtw3Ecxdzd78In+vO4kxszTBJ63D5UlRumYN3FRbYxg
 gPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771840192; x=1772444992;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rkJsbjgrPmHKuVtyeITCWuo6Qs6gxTemZ0gXWydw0S4=;
 b=L7/n7jrEBmvnGBdTBBWXIcqQPxfLELjtQgv7J8QPCnsKQvVCNfQLfVmXqZQkUElkZU
 xuygcanOnE5GCATN+4iYZCW9AViHKqvJsG0tKusDKGR0sOtnyRoPBQxoJhIeIZIihga6
 xu0gF/Y7r9xOoqu9sEb4khp1f67H79ktPCcWaAiWiyIlNRwO4t85TrXryFsAq+Z1z1z4
 fo8xlFr9eMxzhouL30y8BOKDLymr6b+LehoI2xVrWqQvVNDGcoG5E52Lpzp/ioxhYx2m
 EcU9amW/k2nuvAk+snV+teanmvf8O4PFC9+VXPZ13jBcrUJs4za6KbrldlJG7gJjZ6mu
 0ZUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI27FOSQr0EkP5SzMpL/RqXSbQ4ha+fCgd9xMsUeEhsTxAKzvHQxEwjA0S5ySW7qqn8Z8X+USMl5jL4g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxIgRM2xciNBc4p8Rr0iXl5pIU8IHEQCf34sOBzBtTJJKHKj+v9
 vNz+1xqCwIY99G49WtOzDhXbU/lrI8IWmR739Cp18Ju2VvjWGbcmHNpz1uSbnEL/fe1WZxxV8ni
 zF1m/zSN9mI1BZ2aUY2oEHXt8vx3Qj+82mP9UrFRN3eD6TcFCudgADlK0juEB++/95uM+J4Aitl
 ENQVRLH6g=
X-Gm-Gg: AZuq6aIESvvG6xRNvo8gFMqCuwaoTmh9AedOOUHK4/73620u23Uf3KZF1CB1H4bKtYE
 HBuzG1srd+0AGe3udbCNtpi8TriL2wjKMcz0XI44/GAITibmFVp8AL5Fy9v2I1C0pEUBCIh0T4f
 YFACCJtIVJve3SeGoKoMOim4K7eIz3em8Jj2pio6WItLwt5QwWEZ1Q0IilRbsLnWPFNbRuezMsP
 zJ1fCjblK3Zhl3PGqxbQpiO7JuiAAgjmcwgXQWi7lcp8fQHXYwhcYJLqiizzOhpIgHnwSaSKyAP
 t8q60g3svc8N/uJX1CWF3ZQAB8Cdj+cmGXIeko54bzzLLCTHgQ86Tq9E3BOePXdYSYAH33OsfFN
 JeLcn+Gc56Hn4lKvvyjbn0aSFg+GktcCC7QA=
X-Received: by 2002:a05:6a00:4b4f:b0:81f:52d9:5f5 with SMTP id
 d2e1a72fcca58-826da8bdbc3mr6321599b3a.10.1771840192222; 
 Mon, 23 Feb 2026 01:49:52 -0800 (PST)
X-Received: by 2002:a05:6a00:4b4f:b0:81f:52d9:5f5 with SMTP id
 d2e1a72fcca58-826da8bdbc3mr6321581b3a.10.1771840191756; 
 Mon, 23 Feb 2026 01:49:51 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd8baa34sm7795039b3a.51.2026.02.23.01.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 01:49:51 -0800 (PST)
Date: Mon, 23 Feb 2026 15:19:45 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aZwiuVeEAcuEnP8F@oss.qualcomm.com>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX7hEcFFptg9Mn
 SrGyPN7LoLc9POOiFZ2nDBaev62EnIPw9elM82SlwH2rWa0ktXKv5AtGdw0mT4GeTNlVsxcsenr
 Q3Su+OCEYNc/u/Ugs4Lbm+0i6YIjgofgOeK/GID8sE5FFpwmaiEtFHebbYflCcJIrtrVDPICu8s
 FP1weP2qfBvp6Z2zv4R9RBRtfJMuKtmx5x6uqKJZeEnXo+h+XJv3MpeV6NtjfQj4vXkAa5iBITj
 6JMqj9y9eTckPqDA7gVr7Sng5Idl8vsA+mt14HUa18vrbNmxGyFbNvMYulFWNUOt/iwkimufmIF
 aGXwxxNQiv8oLE8ovxgO4jBiQXVfGFNPESgqhd0XnoTiAYWY1920sPgazWmhPsgEQlagWkUbPk+
 LuXDmWIeLT9qiSfBFkCiE/SsSVcJx4M3kmz5+BqpJAulQlsgR79QQqF637qeYbiDN0nFS4MgCcN
 ufCAeT2w2i/YyTi83hA==
X-Proofpoint-GUID: cKflcZTzL3GPd8snoVMAIYQVwmtjLP6e
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c22c1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=M31p6wNruv26cYMHQocA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: cKflcZTzL3GPd8snoVMAIYQVwmtjLP6e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230084
Cc: Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next+previous 0/9] net: stmmac:
 qcom-ethqos: further updates
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.953];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,qualcomm.com:email,oss.qualcomm.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: AF907174331
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 12:49:08PM +0000, Russell King (Oracle) wrote:
> This is part 2 of the qcom-ethqos series, building on the previous
> series which can be found at
> https://lore.kernel.org/r/aY0aJppQWUC52OUq@shell.armlinux.org.uk
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> The underlying ideas here are:
> 
> - get rid of the driver using phy_set_speed() with SPEED_1000 and
>   SPEED_2500 which makes no sense for an ethernet SerDes due to the
>   PCS 8B10B data encoding, which inflates the data rate at the SerDes
>   compared to the MAC.
> - allow phy_power_on() / phy_set_mode*() to be called in any order.
> 
> I've included the set_clk_tx_rate() patch as that was tested, which
> would make applying this series awkward to apply without it.
> 
> Mohd, please could you test this series - I'm hoping it will pass with
> flying colours as there should be no change to the order in which we
> program the hardware. Thanks.
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 52 +++++++-----------
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          | 62 +++++++++++++++++-----
>  2 files changed, 68 insertions(+), 46 deletions(-)
> 

After changing phy_set_mode() to phy_set_mode_ext() in
dwmac-qcom-ethqos.c, no issues found on:

  - QCS9100 Ride R3 (AQR115C PHY, 2500BASE-X) - 2.5G/1G/100M
  - IQ9 EVK (QCA8081 PHY, 2500BASE-X) - 2.5G

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
