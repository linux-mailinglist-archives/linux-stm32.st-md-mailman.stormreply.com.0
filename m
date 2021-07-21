Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2AD3DD332
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:44:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41A5EC5A4D1;
	Mon,  2 Aug 2021 09:44:40 +0000 (UTC)
Received: from qq.com (smtpbg566.qq.com [183.3.255.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A52F5CFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 06:08:24 +0000 (UTC)
X-QQ-mid: bizesmtp41t1626847688tenand6n
Received: from [10.20.53.139] (unknown [113.57.152.160])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 21 Jul 2021 14:08:07 +0800 (CST)
X-QQ-SSF: 00400000000000209000B00B0000000
X-QQ-FEAT: U/TFEMEjH1V/pCrJme/K7NAuV9tTPV7DcDQli/h9U3DK0o1ce+U5oKUNdiLSa
 pzGau/ti/xUapsEQdCuZeh+clUhZKFCWT1A4nQpraZ7pJD4E5ic3T5loMLDDdyphxJHC3IM
 mgQecveHaWYKfizVtgVMClFOOOchNvwv4UtGLeJVPkSM+90h1ZOa2NEz7sq7DQFco4P/SjX
 Fz2vLV3LzxFbIOkhc50oqMbvpKbDvV9jOhF7hkOhwwLlTVRXwcc/9jWRfGLNh54G7QTNJPG
 PxuVCOqQpI0QzWPPy06HXrwZlChUPYi1naQcc2ZuRTsTd3ee0TtD3ZHB6gGT6yVp/6bej6J
 8wmncNq4CUMxR+UcrW8uuzAk6D2zelECktv0WWmDIOroS5nVGvYhuwsc0m7aeWAn4+lcx1r
X-QQ-GoodBg: 2
To: Joakim Zhang <qiangqing.zhang@nxp.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
References: <20210719130845.2102-1-chenhaoa@uniontech.com>
 <b0c93757-dd32-9d85-6f9e-12956d766661@gmail.com>
 <42334152-cdc8-902f-8f79-ab267346347c@uniontech.com>
 <DB8PR04MB6795C17FB0FEAD38F749EAFDE6E39@DB8PR04MB6795.eurprd04.prod.outlook.com>
From: Hao Chen <chenhaoa@uniontech.com>
Message-ID: <3162652a-4e8c-8e63-2474-3e980d1ffa74@uniontech.com>+78119FF59A720E28
Date: Wed, 21 Jul 2021 14:07:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <DB8PR04MB6795C17FB0FEAD38F749EAFDE6E39@DB8PR04MB6795.eurprd04.prod.outlook.com>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgweb:qybgweb13
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:44:19 +0000
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v5] net: stmmac: fix 'ethtool -P' return
	-EBUSY
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
Content-Type: multipart/mixed; boundary="===============8055392150732947347=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is a multi-part message in MIME format.
--===============8055392150732947347==
Content-Type: multipart/alternative;
 boundary="------------BAB417321B4C8D7986588479"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BAB417321B4C8D7986588479
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2021/7/21 上午11:02, Joakim Zhang 写道:
>> -----Original Message-----
>> From: Hao Chen <chenhaoa@uniontech.com>
>> Sent: 2021年7月21日 9:35
>> To: Heiner Kallweit <hkallweit1@gmail.com>
>> Cc: alexandre.torgue@foss.st.com; joabreu@synopsys.com;
>> davem@davemloft.net; kuba@kernel.org; mcoquelin.stm32@gmail.com;
>> linux@armlinux.org.uk; netdev@vger.kernel.org;
>> linux-stm32@st-md-mailman.stormreply.com; Joakim Zhang
>> <qiangqing.zhang@nxp.com>; peppe.cavallaro@st.com
>> Subject: Re: [PATCH v5] net: stmmac: fix 'ethtool -P' return -EBUSY
>>
>>
>> 在 2021/7/19 下午9:57, Heiner Kallweit 写道:
>>> On 19.07.2021 15:08, Hao Chen wrote:
>>>> The permanent mac address should be available for query when the
>>>> device is not up.
>>>> NetworkManager, the system network daemon, uses 'ethtool -P' to
>>>> obtain the permanent address after the kernel start. When the network
>>>> device is not up, it will return the device busy error with 'ethtool
>>>> -P'. At that time, it is unable to access the Internet through the
>>>> permanent address by NetworkManager.
>>> At first a few formal aspects:
>>> - You don't get a lot of new friends when posting a new version every
>>>     few hours. Consolidate feedback and then post a new version,
>>>     typically not more than one version per day. Mileage of maintainers
>>>     may vary here.
>>> - When posting a new version include a change log.
>>> - Properly annotate the patch as net vs. net-next.
>>> - If you declare something to be a fix, add a Fixes tag.
>> Thanks for your guidance.
>>>> I think that the '.begin' is not used to check if the device is up,
>>>> it's just a pre hook for ethtool. We shouldn't check if the device is
>>>> up there.
>>>>
>>> Supposedly the check is there for a reason. Your statement leaves the
>>> impression that you're not aware of why the check exists.
>>> Therefore: First understand this, and then explain why it's safe to
>>> remove the check. This drivers uses runtime pm, so device might be in
>>> PCI D3 if interface is down (don't know this driver in detail).
>>> Therefore registers may not be accessible what may impact certain
>>> ethtool ops.
>> The network manager obtains and stores the permanent MAC address before
>> the network
>>
>> card is up, and then the user can specify the MAC address of the device in the
>> desktop network
>>
>> manager for networking.
>>
>>
>> If the driver needs the network card up to obtain the permanent MAC address,
>> the user will
>>
>> not be able to specify the device MAC address for networking after power on.
> I'm not sure quite understand what's your requirements, AFAIK, NIC driver has
> .ndo_set_mac_address to set mac address, and it can be done whether ifup or ifdown.

I want to get permanent MAC address when the card is down.And I think it 
is more convenient to get statistics

in the down state by ethtool -S. But current all of the ethool command 
return -EBUSY.

>
>> I don't think we should detect that the network card is up in '. Begin', which will
>> cause that
>>
>> all the ethtool commands can't be used when the network card is down. If
>> some ethtool
>>
>> commands can only be used in the up state, they should be detected in the
>> corresponding
>>
>> ethool OPS function instead of in the pre hook. This is too rude and
>> unreasonable.
>>
>>
>> As for safe, remove the '. Begin' implementation. After modification, it
>> should be safer to
>>
>> operate Ethernet in the down state than in the up state.
> As Heiner mentioned, ethtool ops may access NIC hardware registers which need
> clocks enabled. Now we have .begin that means clocks enabled when use ethtool,
> if you remove .begin, you need ensure clocks enabled whenever ethtool used. So,
> remove .begin directly wound not be acceptable.
Yeah.
>> I have checked the '. Begin' implementation of other drivers, most of
>> which support the
>>
>> submission of NIC driver for the first time. They are too long to know
>> why '. Begin' is
>>
>> implemented. I suspect that they have not noticed the usage of '. Begin'.
>>
>> In cpsw NIC driver, commit ID 7898b1daf0555, a bug was found to be fixed:
>>
>> "The CPSW might be suspended by RPM if all ethX interfaces are down,
>>
>> but it still could be accesible through ethtool interfce. In this case
>> ethtool operations, requiring registers access, will cause L3 errors and
>> CPSW crash."
>>
>> My machine uses platform GMAC. I don't have PCI network card. I can't
>> test the use
>>
>> of PCI network card. Through cat /sys/devices/... /power/
>> runtime_status, return
>>
>> unsupported. Therefore, runtime PM is not supported.
> I have a GMAC5.10 at my hand, and check the runtime PM status on net-next tree:
> ~# cat /sys/class/net/eth0/device/power/runtime_status
> Active
>
> Another main you said:
> "By browse the code and test it,  I find that stmmac not support runtime_status,
>
> pm_runtime_get_sync will return -13 errno. So shouldn't modify it in this way.
>
> I think we should just delete the implementation of begin, it's a pre hook for ethtool."
>
> I don't know why " pm_runtime_get_sync will return -13 errno ". If so, STMMAC driver still
> can work at you side? Clocks always enabled after probed?
>
> Best Regards,
> Joakim Zhang

I find -13 error is because there:

@@drivers/base/power/runtime.c

    733 static int rpm_resume(struct device *dev, int rpmflags)
    734         __releases(&dev->power.lock) __acquires(&dev->power.lock)
    735 {
......
    743         if (dev->power.runtime_error)
    744                 retval = -EINVAL;
    745         else if (dev->power.disable_depth == 1 && 
dev->power.is_suspended
    746             && dev->power.runtime_status == RPM_ACTIVE)
    747                 retval = 1;
    748         else if (dev->power.disable_depth > 0)
    749                 retval = -EACCES;                  //-13 errno.
    750         if (retval)
    751                 goto out;
......
}

I used the kernel changed base on 4.19.90,maybe there is some problem 
that I don't know.

The pm_runtime_get_sync is called at stmmac_open at latest kernel . 
Maybe only I have problem when call

pm_runtime_get_sync at '.begin' :-(

@drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

   3629 int stmmac_open(struct net_device *dev)
   3630 {
   3631         struct stmmac_priv *priv = netdev_priv(dev);
   3632         int mode = priv->plat->phy_interface;
   3633         int bfsize = 0;
   3634         u32 chan;
   3635         int ret;
3636
   3637         ret = pm_runtime_get_sync(priv->device);
   3638         if (ret < 0) {
   3639 pm_runtime_put_noidle(priv->device);
   3640                 return ret;
   3641         }

>> To sum up, I think it's better to remove the '. Begin' implementation here.
>>
>> Or use the following implementation:
>>
>>     static int stmmac_ethtool_begin(struct net_device *dev)
>> {
>>             struct stmmac_priv *priv = netdev_priv(dev);
>>             int ret;
>>
>>             if (strcmp(priv->device->bus_type->name, "pci"))
>>                     return 0;
>>
>>             return pm_runtime_resume_and_get(dev);
>> }
>>
>>     static void stmmac_ethtool_complete(struct net_device *dev)
>> {
>>             struct stmmac_priv *priv = netdev_priv(dev);
>>
>>             if (strcmp(priv->device->bus_type->name, "pci"))
>> return;
>>
>> pm_runtime_put(priv->device);
>>     }
>>
>>    .begin = stmmac_ethtool_begin,
>>    .complete = stmmac_ethtool_complete,

This go to be:

static int stmmac_ethtool_begin(struct net_device *dev)
{
	struct stmmac_priv *priv = netdev_priv(dev);

	return pm_runtime_resume_and_get(dev);
}

static void stmmac_ethtool_complete(struct net_device *dev)
{
	struct stmmac_priv *priv = netdev_priv(dev);

	pm_runtime_put(priv->device);
}

   .begin = stmmac_ethtool_begin,
   .complete = stmmac_ethtool_complete,

>>>> Signed-off-by: Hao Chen <chenhaoa@uniontech.com>
>>>> ---
>>>>    drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 8 --------
>>>>    1 file changed, 8 deletions(-)
>>>>
>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
>> b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
>>>> index d0ce608b81c3..8901dc9f758e 100644
>>>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
>>>> @@ -410,13 +410,6 @@ static void stmmac_ethtool_setmsglevel(struct
>> net_device *dev, u32 level)
>>>>    }
>>>>
>>>> -static int stmmac_check_if_running(struct net_device *dev)
>>>> -{
>>>> -	if (!netif_running(dev))
>>>> -		return -EBUSY;
>>>> -	return 0;
>>>> -}
>>>> -
>>>>    static int stmmac_ethtool_get_regs_len(struct net_device *dev)
>>>>    {
>>>>    	struct stmmac_priv *priv = netdev_priv(dev);
>>>> @@ -1073,7 +1066,6 @@ static int stmmac_set_tunable(struct net_device
>> *dev,
>>>>    static const struct ethtool_ops stmmac_ethtool_ops = {
>>>>    	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
>>>>    				     ETHTOOL_COALESCE_MAX_FRAMES,
>>>> -	.begin = stmmac_check_if_running,
>>>>    	.get_drvinfo = stmmac_ethtool_getdrvinfo,
>>>>    	.get_msglevel = stmmac_ethtool_getmsglevel,
>>>>    	.set_msglevel = stmmac_ethtool_setmsglevel,
>>>>

--------------BAB417321B4C8D7986588479
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2021/7/21 上午11:02, Joakim Zhang 写道:<br>
    </div>
    <blockquote type="cite"
cite="mid:DB8PR04MB6795C17FB0FEAD38F749EAFDE6E39@DB8PR04MB6795.eurprd04.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: Hao Chen <a class="moz-txt-link-rfc2396E" href="mailto:chenhaoa@uniontech.com">&lt;chenhaoa@uniontech.com&gt;</a>
Sent: 2021年7月21日 9:35
To: Heiner Kallweit <a class="moz-txt-link-rfc2396E" href="mailto:hkallweit1@gmail.com">&lt;hkallweit1@gmail.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:alexandre.torgue@foss.st.com">alexandre.torgue@foss.st.com</a>; <a class="moz-txt-link-abbreviated" href="mailto:joabreu@synopsys.com">joabreu@synopsys.com</a>;
<a class="moz-txt-link-abbreviated" href="mailto:davem@davemloft.net">davem@davemloft.net</a>; <a class="moz-txt-link-abbreviated" href="mailto:kuba@kernel.org">kuba@kernel.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:mcoquelin.stm32@gmail.com">mcoquelin.stm32@gmail.com</a>;
<a class="moz-txt-link-abbreviated" href="mailto:linux@armlinux.org.uk">linux@armlinux.org.uk</a>; <a class="moz-txt-link-abbreviated" href="mailto:netdev@vger.kernel.org">netdev@vger.kernel.org</a>;
<a class="moz-txt-link-abbreviated" href="mailto:linux-stm32@st-md-mailman.stormreply.com">linux-stm32@st-md-mailman.stormreply.com</a>; Joakim Zhang
<a class="moz-txt-link-rfc2396E" href="mailto:qiangqing.zhang@nxp.com">&lt;qiangqing.zhang@nxp.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:peppe.cavallaro@st.com">peppe.cavallaro@st.com</a>
Subject: Re: [PATCH v5] net: stmmac: fix 'ethtool -P' return -EBUSY


在 2021/7/19 下午9:57, Heiner Kallweit 写道:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 19.07.2021 15:08, Hao Chen wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">The permanent mac address should be available for query when the
device is not up.
NetworkManager, the system network daemon, uses 'ethtool -P' to
obtain the permanent address after the kernel start. When the network
device is not up, it will return the device busy error with 'ethtool
-P'. At that time, it is unable to access the Internet through the
permanent address by NetworkManager.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">At first a few formal aspects:
- You don't get a lot of new friends when posting a new version every
   few hours. Consolidate feedback and then post a new version,
   typically not more than one version per day. Mileage of maintainers
   may vary here.
- When posting a new version include a change log.
- Properly annotate the patch as net vs. net-next.
- If you declare something to be a fix, add a Fixes tag.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Thanks for your guidance.
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">I think that the '.begin' is not used to check if the device is up,
it's just a pre hook for ethtool. We shouldn't check if the device is
up there.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Supposedly the check is there for a reason. Your statement leaves the
impression that you're not aware of why the check exists.
Therefore: First understand this, and then explain why it's safe to
remove the check. This drivers uses runtime pm, so device might be in
PCI D3 if interface is down (don't know this driver in detail).
Therefore registers may not be accessible what may impact certain
ethtool ops.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The network manager obtains and stores the permanent MAC address before
the network

card is up, and then the user can specify the MAC address of the device in the
desktop network

manager for networking.


If the driver needs the network card up to obtain the permanent MAC address,
the user will

not be able to specify the device MAC address for networking after power on.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not sure quite understand what's your requirements, AFAIK, NIC driver has
.ndo_set_mac_address to set mac address, and it can be done whether ifup or ifdown.</pre>
    </blockquote>
    <p>I want to get permanent MAC address when the card is down.And I
      think it is more convenient to get statistics</p>
    <p> in the down state by ethtool -S. But current all of the ethool
      command return -EBUSY.<br>
    </p>
    <blockquote type="cite"
cite="mid:DB8PR04MB6795C17FB0FEAD38F749EAFDE6E39@DB8PR04MB6795.eurprd04.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I don't think we should detect that the network card is up in '. Begin', which will
cause that

all the ethtool commands can't be used when the network card is down. If
some ethtool

commands can only be used in the up state, they should be detected in the
corresponding

ethool OPS function instead of in the pre hook. This is too rude and
unreasonable.


As for safe, remove the '. Begin' implementation. After modification, it
should be safer to

operate Ethernet in the down state than in the up state.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
As Heiner mentioned, ethtool ops may access NIC hardware registers which need
clocks enabled. Now we have .begin that means clocks enabled when use ethtool,
if you remove .begin, you need ensure clocks enabled whenever ethtool used. So,
remove .begin directly wound not be acceptable.
</pre>
    </blockquote>
    Yeah.<br>
    <blockquote type="cite"
cite="mid:DB8PR04MB6795C17FB0FEAD38F749EAFDE6E39@DB8PR04MB6795.eurprd04.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I have checked the '. Begin' implementation of other drivers, most of
which support the

submission of NIC driver for the first time. They are too long to know
why '. Begin' is

implemented. I suspect that they have not noticed the usage of '. Begin'.

In cpsw NIC driver, commit ID 7898b1daf0555, a bug was found to be fixed:

"The CPSW might be suspended by RPM if all ethX interfaces are down,

but it still could be accesible through ethtool interfce. In this case
ethtool operations, requiring registers access, will cause L3 errors and
CPSW crash."

My machine uses platform GMAC. I don't have PCI network card. I can't
test the use

of PCI network card. Through cat /sys/devices/... /power/
runtime_status, return

unsupported. Therefore, runtime PM is not supported.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I have a GMAC5.10 at my hand, and check the runtime PM status on net-next tree:
~# cat /sys/class/net/eth0/device/power/runtime_status
Active

Another main you said:
"By browse the code and test it,  I find that stmmac not support runtime_status,

pm_runtime_get_sync will return -13 errno. So shouldn't modify it in this way.

I think we should just delete the implementation of begin, it's a pre hook for ethtool."

I don't know why " pm_runtime_get_sync will return -13 errno ". If so, STMMAC driver still
can work at you side? Clocks always enabled after probed?

Best Regards,
Joakim Zhang</pre>
    </blockquote>
    <p>I find -13 error is because there:</p>
    <p>@@drivers/base/power/runtime.c
      <style>
@font-face{
font-family:"Times New Roman";
}

@font-face{
font-family:"宋体";
}

@font-face{
font-family:"DejaVu Sans";
}

@font-face{
font-family:"Noto Serif";
}

@font-face{
font-family:"CESI宋体-GB2312";
}

p.MsoNormal{
mso-style-name:正文;
mso-style-parent:"";
margin-bottom:7.0000pt;
text-indent:0.0000pt;
mso-char-indent-count:0.0000;
mso-pagination:none;
text-align:left;
line-height:16.0000pt;
mso-line-height-rule:exactly;
font-family:'Noto Serif';
mso-fareast-font-family:CESI宋体-GB2312;
mso-bidi-font-family:'Times New Roman';
font-size:10.5000pt;
mso-font-kerning:1.0000pt;
}

p.MsoFooter{
mso-style-name:页脚;
margin-bottom:7.0000pt;
text-indent:0.0000pt;
mso-char-indent-count:0.0000;
layout-grid-mode:char;
mso-pagination:none;
text-align:left;
line-height:16.0000pt;
mso-line-height-rule:exactly;
font-family:'Noto Serif';
mso-fareast-font-family:CESI宋体-GB2312;
mso-bidi-font-family:'Times New Roman';
font-size:9.0000pt;
mso-font-kerning:1.0000pt;
}

p.MsoHeader{
mso-style-name:页眉;
margin-bottom:7.0000pt;
text-indent:0.0000pt;
mso-char-indent-count:0.0000;
border-top:none;
mso-border-top-alt:none;
border-right:none;
mso-border-right-alt:none;
border-bottom:none;
mso-border-bottom-alt:none;
border-left:none;
mso-border-left-alt:none;
padding:1pt 4pt 1pt 4pt ;
layout-grid-mode:char;
mso-pagination:none;
text-align:justify;
text-justify:inter-ideograph;
font-family:'DejaVu Sans';
mso-fareast-font-family:CESI宋体-GB2312;
mso-bidi-font-family:'Times New Roman';
font-size:9.0000pt;
mso-font-kerning:1.0000pt;
}

p.MsoBodyText{
mso-style-name:正文文本;
margin-top:0.0000pt;
margin-bottom:7.0000pt;
text-indent:0.0000pt;
mso-char-indent-count:0.0000;
mso-pagination:none;
text-align:left;
line-height:20.0000pt;
mso-line-height-rule:exactly;
font-family:'Noto Serif';
mso-fareast-font-family:CESI宋体-GB2312;
mso-bidi-font-family:'Times New Roman';
font-size:10.5000pt;
mso-font-kerning:1.0000pt;
}

span.msoIns{
mso-style-type:export-only;
mso-style-name:"";
text-decoration:underline;
text-underline:single;
color:blue;
}

span.msoDel{
mso-style-type:export-only;
mso-style-name:"";
text-decoration:line-through;
color:red;
}
}
div.Section0{page:Section0;}</style></p>
    <p>   733 static int rpm_resume(struct device *dev, int
rpmflags)                                                                                                            
<br>
         734         __releases(&amp;dev-&gt;power.lock)
      __acquires(&amp;dev-&gt;power.lock)
<br>
         735 {
<br>
      ......
<br>
         743         if
(dev-&gt;power.runtime_error)                                                                                                                              
<br>
         744                 retval =
-EINVAL;                                                                                                                                  
<br>
         745         else if (dev-&gt;power.disable_depth == 1
      &amp;&amp;
dev-&gt;power.is_suspended                                                                                          
<br>
         746             &amp;&amp; dev-&gt;power.runtime_status ==
RPM_ACTIVE)                                                                                                            
<br>
         747                 retval =
1;                                                                                                                                        
<br>
         748         else if (dev-&gt;power.disable_depth &gt;
0)                                                                                                                     
<br>
         749                 retval = -EACCES;                  //-13
      errno.
                                                                                                               
<br>
         750         if
(retval)                                                                                                                                                
<br>
         751                 goto out; 
<br>
      ......
<br>
      }<br>
    </p>
    <p>I used the kernel changed base on 4.19.90,maybe there is some
      problem that I don't know.</p>
    <p>The pm_runtime_get_sync is called at stmmac_open at latest kernel
      . Maybe only I have problem when call <br>
    </p>
    <p>pm_runtime_get_sync at '.begin' :-(<br>
    </p>
    <p>@drivers/net/ethernet/stmicro/stmmac/stmmac_main.c<br>
    </p>
    <p>  3629 int stmmac_open(struct net_device
*dev)                                                                                                                           
      <br>
        3630
{                                                                                                                                                                 
      <br>
        3631         struct stmmac_priv *priv =
netdev_priv(dev);                                                                                                              
      <br>
        3632         int mode =
priv-&gt;plat-&gt;phy_interface;                                                                                                                     
      <br>
        3633         int bfsize =
0;                                                                                                                                           
      <br>
        3634         u32
chan;                                                                                                                                                 
      <br>
        3635         int
ret;                                                                                                                                                  
      <br>
       
3636                                                                                                                                                                   
      <br>
        3637         ret =
pm_runtime_get_sync(priv-&gt;device);                                                                                                                  
      <br>
        3638         if (ret &lt; 0)
{                                                                                                                                            
      <br>
        3639                
pm_runtime_put_noidle(priv-&gt;device);                                                                                                              
      <br>
        3640                 return
ret;                                                                                                                                       
      <br>
        3641         }<br>
    </p>
    <p>
      <style>
@font-face{
font-family:"Times New Roman";
}

@font-face{
font-family:"宋体";
}

@font-face{
font-family:"DejaVu Sans";
}

@font-face{
font-family:"Noto Serif";
}

@font-face{
font-family:"CESI宋体-GB2312";
}

@font-face{
font-family:"Courier New";
}

@font-face{
font-family:"DejaVu Sans Mono";
}

@font-face{
font-family:"CESI仿宋-GB2312";
}

p.MsoNormal{
mso-style-name:正文;
mso-style-parent:"";
margin-bottom:7.0000pt;
text-indent:0.0000pt;
mso-char-indent-count:0.0000;
mso-pagination:none;
text-align:left;
line-height:16.0000pt;
mso-line-height-rule:exactly;
font-family:'Noto Serif';
mso-fareast-font-family:CESI宋体-GB2312;
mso-bidi-font-family:'Times New Roman';
font-size:10.5000pt;
mso-font-kerning:1.0000pt;
}

p.MsoFooter{
mso-style-name:页脚;
margin-bottom:7.0000pt;
text-indent:0.0000pt;
mso-char-indent-count:0.0000;
layout-grid-mode:char;
mso-pagination:none;
text-align:left;
line-height:16.0000pt;
mso-line-height-rule:exactly;
font-family:'Noto Serif';
mso-fareast-font-family:CESI宋体-GB2312;
mso-bidi-font-family:'Times New Roman';
font-size:9.0000pt;
mso-font-kerning:1.0000pt;
}

p.MsoHeader{
mso-style-name:页眉;
margin-bottom:7.0000pt;
text-indent:0.0000pt;
mso-char-indent-count:0.0000;
border-top:none;
mso-border-top-alt:none;
border-right:none;
mso-border-right-alt:none;
border-bottom:none;
mso-border-bottom-alt:none;
border-left:none;
mso-border-left-alt:none;
padding:1pt 4pt 1pt 4pt ;
layout-grid-mode:char;
mso-pagination:none;
text-align:justify;
text-justify:inter-ideograph;
font-family:'DejaVu Sans';
mso-fareast-font-family:CESI宋体-GB2312;
mso-bidi-font-family:'Times New Roman';
font-size:9.0000pt;
mso-font-kerning:1.0000pt;
}

p.MsoBodyText{
mso-style-name:正文文本;
margin-top:0.0000pt;
margin-bottom:7.0000pt;
text-indent:0.0000pt;
mso-char-indent-count:0.0000;
mso-pagination:none;
text-align:left;
line-height:20.0000pt;
mso-line-height-rule:exactly;
font-family:'Noto Serif';
mso-fareast-font-family:CESI宋体-GB2312;
mso-bidi-font-family:'Times New Roman';
font-size:10.5000pt;
mso-font-kerning:1.0000pt;
}

p.MsoPlainText{
mso-style-name:纯文本;
margin-bottom:7.0000pt;
text-indent:0.0000pt;
mso-char-indent-count:0.0000;
mso-pagination:none;
text-align:left;
line-height:16.0000pt;
mso-line-height-rule:exactly;
font-family:宋体;
mso-fareast-font-family:CESI宋体-GB2312;
mso-hansi-font-family:'Courier New';
mso-bidi-font-family:'Times New Roman';
font-size:10.5000pt;
mso-font-kerning:1.0000pt;
}
mso-style-name:code;
mso-style-parent:纯文本;
mso-style-next:正文文本;
margin-bottom:1.0000pt;
text-indent:0.0000pt;
mso-char-indent-count:0.0000;
border-top:1.5000pt solid rgb(0,0,0);
mso-border-top-alt:1.5000pt solid rgb(0,0,0);
border-right:1.5000pt solid rgb(0,0,0);
mso-border-right-alt:1.5000pt solid rgb(0,0,0);
border-bottom:1.5000pt solid rgb(0,0,0);
mso-border-bottom-alt:1.5000pt solid rgb(0,0,0);
border-left:1.5000pt solid rgb(0,0,0);
mso-border-left-alt:1.5000pt solid rgb(0,0,0);
padding:1pt 4pt 1pt 4pt ;
mso-pagination:none;
text-align:left;
mso-line-height-alt:0pt;
background:rgb(215,215,215);
font-family:'DejaVu Sans Mono';
mso-fareast-font-family:CESI仿宋-GB2312;
mso-bidi-font-family:'Times New Roman';
color:rgb(0,0,0);
font-size:8.0000pt;
mso-font-kerning:1.0000pt;
}

span.msoIns{
mso-style-type:export-only;
mso-style-name:"";
text-decoration:underline;
text-underline:single;
color:blue;
}

span.msoDel{
mso-style-type:export-only;
mso-style-name:"";
text-decoration:line-through;
color:red;
}
}
div.Section0{page:Section0;}</style></p>
    <blockquote type="cite"
cite="mid:DB8PR04MB6795C17FB0FEAD38F749EAFDE6E39@DB8PR04MB6795.eurprd04.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
To sum up, I think it's better to remove the '. Begin' implementation here.

Or use the following implementation:

   static int stmmac_ethtool_begin(struct net_device *dev)
{
           struct stmmac_priv *priv = netdev_priv(dev);
           int ret;

           if (strcmp(priv-&gt;device-&gt;bus_type-&gt;name, "pci"))
                   return 0;

           return pm_runtime_resume_and_get(dev);
}

   static void stmmac_ethtool_complete(struct net_device *dev)
{
           struct stmmac_priv *priv = netdev_priv(dev);

           if (strcmp(priv-&gt;device-&gt;bus_type-&gt;name, "pci"))
return;

pm_runtime_put(priv-&gt;device);
   }

  .begin = stmmac_ethtool_begin,
  .complete = stmmac_ethtool_complete,</pre>
      </blockquote>
    </blockquote>
    <p>This go to be:</p>
    <pre class="moz-quote-pre" wrap="">static int stmmac_ethtool_begin(struct net_device *dev)
{
	struct stmmac_priv *priv = netdev_priv(dev);

	return pm_runtime_resume_and_get(dev);
}

static void stmmac_ethtool_complete(struct net_device *dev)
{
	struct stmmac_priv *priv = netdev_priv(dev);

	pm_runtime_put(priv-&gt;device);
}

  .begin = stmmac_ethtool_begin,
  .complete = stmmac_ethtool_complete,</pre>
    <blockquote type="cite"
cite="mid:DB8PR04MB6795C17FB0FEAD38F749EAFDE6E39@DB8PR04MB6795.eurprd04.prod.outlook.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Signed-off-by: Hao Chen <a class="moz-txt-link-rfc2396E" href="mailto:chenhaoa@uniontech.com">&lt;chenhaoa@uniontech.com&gt;</a>
---
  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 8 --------
  1 file changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">index d0ce608b81c3..8901dc9f758e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -410,13 +410,6 @@ static void stmmac_ethtool_setmsglevel(struct
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">net_device *dev, u32 level)
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
  }

-static int stmmac_check_if_running(struct net_device *dev)
-{
-	if (!netif_running(dev))
-		return -EBUSY;
-	return 0;
-}
-
  static int stmmac_ethtool_get_regs_len(struct net_device *dev)
  {
  	struct stmmac_priv *priv = netdev_priv(dev);
@@ -1073,7 +1066,6 @@ static int stmmac_set_tunable(struct net_device
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">*dev,
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">  static const struct ethtool_ops stmmac_ethtool_ops = {
  	.supported_coalesce_params = ETHTOOL_COALESCE_USECS |
  				     ETHTOOL_COALESCE_MAX_FRAMES,
-	.begin = stmmac_check_if_running,
  	.get_drvinfo = stmmac_ethtool_getdrvinfo,
  	.get_msglevel = stmmac_ethtool_getmsglevel,
  	.set_msglevel = stmmac_ethtool_setmsglevel,

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------BAB417321B4C8D7986588479--

--===============8055392150732947347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8055392150732947347==--
